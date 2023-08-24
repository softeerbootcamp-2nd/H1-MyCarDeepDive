package com.h1.mycardeepdive.pdf.service;

import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.car.domain.repository.CarSpecRepository;
import com.h1.mycardeepdive.color.domain.ExteriorColor;
import com.h1.mycardeepdive.color.domain.InteriorColor;
import com.h1.mycardeepdive.color.domain.repository.ExteriorColorRepository;
import com.h1.mycardeepdive.color.domain.repository.InteriorColorRepository;
import com.h1.mycardeepdive.exception.ErrorType;
import com.h1.mycardeepdive.exception.MyCarDeepDiveException;
import com.h1.mycardeepdive.global.util.B64ImgReplacedElementFactory;
import com.h1.mycardeepdive.options.domain.repository.OptionsRepository;
import com.h1.mycardeepdive.pdf.domain.PdfInfo;
import com.h1.mycardeepdive.pdf.domain.repository.PdfRepository;
import com.h1.mycardeepdive.pdf.ui.dto.*;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.BaseFont;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.xhtmlrenderer.layout.SharedContext;
import org.xhtmlrenderer.pdf.ITextRenderer;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class PdfService {
    private final SpringTemplateEngine templateEngine;
    private final B64ImgReplacedElementFactory b64ImgReplacedElementFactory;
    private final PdfRepository pdfRepository;
    private final S3Service s3Service;
    private final CarSpecRepository carSpecRepository;
    private final ExteriorColorRepository exteriorColorRepository;
    private final InteriorColorRepository interiorColorRepository;
    private final OptionsRepository optionsRepository;

    private static final List<String> fontList =
            List.of(
                    "NanumSquare_acB.ttf",
                    "NanumSquare_acEB.ttf",
                    "NanumSquare_acL.ttf",
                    "NanumSquare_acR.ttf",
                    "NanumSquareB.ttf",
                    "NanumSquareEB.ttf",
                    "NanumSquareL.ttf",
                    "NanumSquareR.ttf");

    public PdfIdResponse registerPdfId(PdfIdRequest pdfIdRequest) throws Exception {
        CarSpec carSpec =
                carSpecRepository
                        .findById(pdfIdRequest.getCar_spec_id())
                        .orElseThrow(
                                () ->
                                        new MyCarDeepDiveException(
                                                HttpStatus.BAD_REQUEST, ErrorType.PDF_NOT_FOUND));
        List<SimpleOption> simpleOptionList =
                optionsRepository
                        .findAllOptionsByList(pdfIdRequest.getAdditional_option_id_list())
                        .stream()
                        .map(
                                option ->
                                        new SimpleOption(
                                                option.getName(),
                                                option.getPrice(),
                                                option.getImgUrl()))
                        .collect(Collectors.toList());

        InteriorColor interiorColor =
                interiorColorRepository
                        .findById(pdfIdRequest.getInterior_color_id())
                        .orElseThrow(
                                () ->
                                        new MyCarDeepDiveException(
                                                HttpStatus.BAD_REQUEST,
                                                ErrorType.INVALID_REQUEST_ERROR));
        ExteriorColor exteriorColor =
                exteriorColorRepository
                        .findById(pdfIdRequest.getExterior_color_id())
                        .orElseThrow(
                                () ->
                                        new MyCarDeepDiveException(
                                                HttpStatus.BAD_REQUEST,
                                                ErrorType.INVALID_REQUEST_ERROR));
        PdfInfo pdfInfo =
                PdfInfo.builder()
                        .car_image_url(exteriorColor.getExteriorImgUrl() + "/image_001.png")
                        .car_name(carSpec.getCar().getName())
                        .engine_name(carSpec.getEngine().getName())
                        .driving_system_name(carSpec.getDrivingSystem().getName())
                        .trim_name(carSpec.getTrim().getName())
                        .body_name(carSpec.getBody().getName())
                        .max_torque(carSpec.getEngine().getMaxTorque())
                        .max_power(carSpec.getEngine().getMaxPower())
                        .exterior_color_name(exteriorColor.getName())
                        .exterior_color_img_url(exteriorColor.getImgUrl())
                        .exterior_color_price(exteriorColor.getPrice())
                        .interior_color_name(interiorColor.getName())
                        .interior_color_img_url(interiorColor.getImgUrl())
                        .interior_color_price(interiorColor.getPrice())
                        .optionList(simpleOptionList)
                        .basic_price(carSpec.getPrice())
                        .build();
        pdfInfo = pdfRepository.save(pdfInfo);
        byte[] pdfBytes = generatePdf(pdfInfo.getId());
        MockMultipartFile pdfMultipartFile = new MockMultipartFile("pdfId", pdfBytes);
        String fileUrl = s3Service.saveFile(pdfMultipartFile, pdfInfo.getId());

        pdfInfo.setPdf_url(fileUrl);
        pdfRepository.save(pdfInfo);
        return new PdfIdResponse(pdfInfo.getId());
    }

    public PdfUrlResponse findPdf(String pdfId) throws Exception {
        PdfInfo pdfInfo =
                pdfRepository
                        .findById(pdfId)
                        .orElseThrow(
                                () ->
                                        new MyCarDeepDiveException(
                                                HttpStatus.BAD_REQUEST, ErrorType.PDF_NOT_FOUND));
        return new PdfUrlResponse(pdfInfo.getPdf_url());
    }

    public byte[] generatePdf(String pdfId) throws Exception {
        PdfInfo pdfInfo =
                pdfRepository
                        .findById(pdfId)
                        .orElseThrow(
                                () ->
                                        new MyCarDeepDiveException(
                                                HttpStatus.BAD_REQUEST, ErrorType.PDF_NOT_FOUND));
        String htmlContent = getHtmlContentFromThymeleafTemplate(pdfInfo);
        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            ITextRenderer renderer = new ITextRenderer();
            SharedContext sharedContext = renderer.getSharedContext();
            sharedContext.setPrint(true);
            sharedContext.setInteractive(false);
            sharedContext.setReplacedElementFactory(b64ImgReplacedElementFactory);
            addFonts(renderer);
            renderer.setDocumentFromString(htmlContent);
            renderer.layout();
            renderer.createPDF(outputStream);

            return outputStream.toByteArray();
        }
    }

    private String getHtmlContentFromThymeleafTemplate(PdfInfo pdfInfo) {
        Context thymeleafContext = new Context();
        thymeleafContext.setVariable(
                "modelName",
                pdfInfo.getCar_name()
                        + " "
                        + pdfInfo.getEngine_name()
                        + " "
                        + pdfInfo.getTrim_name()
                        + " "
                        + pdfInfo.getBody_name());

        thymeleafContext.setVariable("carImgUrl", pdfInfo.getCar_image_url());
        thymeleafContext.setVariable("modelPrice", pdfInfo.getBasic_price());
        thymeleafContext.setVariable("maxPower", pdfInfo.getMax_power());
        thymeleafContext.setVariable("maxTorque", pdfInfo.getMax_torque());
        thymeleafContext.setVariable("exteriorColorName", pdfInfo.getExterior_color_name());
        thymeleafContext.setVariable("exteriorColorUrl", pdfInfo.getExterior_color_img_url());
        thymeleafContext.setVariable("exteriorColorPrice", pdfInfo.getExterior_color_price());
        thymeleafContext.setVariable("interiorColorName", pdfInfo.getInterior_color_name());
        thymeleafContext.setVariable("interiorColorUrl", pdfInfo.getInterior_color_img_url());
        thymeleafContext.setVariable("interiorColorPrice", pdfInfo.getInterior_color_price());
        thymeleafContext.setVariable("options", pdfInfo.getOptionList());

        long total_price =
                pdfInfo.getBasic_price()
                        + pdfInfo.getExterior_color_price()
                        + pdfInfo.getInterior_color_price()
                        + pdfInfo.getOptionList().stream()
                                .mapToLong(SimpleOption::getOption_price)
                                .sum();

        thymeleafContext.setVariable("totalPrice", total_price);
        return templateEngine.process("template", thymeleafContext);
    }

    private void addFonts(ITextRenderer renderer) throws IOException {
        fontList.forEach(
                font -> {
                    try {
                        renderer.getFontResolver()
                                .addFont(getFontPath(font), BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
                    } catch (IOException | DocumentException e) {
                        throw new MyCarDeepDiveException(
                                HttpStatus.INTERNAL_SERVER_ERROR, ErrorType.FONT_ERROR);
                    }
                });
    }

    private String getFontPath(String fontName) throws IOException {
        return new ClassPathResource(String.format("static/font/%s", fontName)).getURL().toString();
    }

    public CarInformation findCarInformation(String pdfId) {
        PdfInfo pdfInfo =
                pdfRepository
                        .findById(pdfId)
                        .orElseThrow(
                                () ->
                                        new MyCarDeepDiveException(
                                                HttpStatus.BAD_REQUEST, ErrorType.PDF_NOT_FOUND));
        long option_total_price =
                pdfInfo.getOptionList().stream().mapToLong(SimpleOption::getOption_price).sum()
                        + pdfInfo.getBasic_price();

        return new CarInformation(
                pdfInfo.getCar_name(),
                pdfInfo.getEngine_name(),
                pdfInfo.getDriving_system_name(),
                pdfInfo.getTrim_name(),
                pdfInfo.getBody_name(),
                pdfInfo.getExterior_color_name(),
                pdfInfo.getExterior_color_img_url(),
                pdfInfo.getExterior_color_price(),
                pdfInfo.getInterior_color_name(),
                pdfInfo.getInterior_color_img_url(),
                pdfInfo.getInterior_color_price(),
                pdfInfo.getOptionList(),
                pdfInfo.getBasic_price(),
                pdfInfo.getPdf_url(),
                option_total_price);
    }
}
