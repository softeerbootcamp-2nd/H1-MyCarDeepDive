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
import java.time.LocalDateTime;
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
    public static final String PDF_ID = "pdfId";
    public static final String MODEL_NAME = "modelName";
    public static final String BLANK = " ";
    public static final String CAR_IMG_URL = "carImgUrl";
    public static final String MODEL_PRICE = "modelPrice";
    public static final String MAX_POWER = "maxPower";
    public static final String MAX_TORQUE = "maxTorque";
    public static final String EXTERIOR_COLOR_NAME = "exteriorColorName";
    public static final String EXTERIOR_COLOR_URL = "exteriorColorUrl";
    public static final String EXTERIOR_COLOR_PRICE = "exteriorColorPrice";
    public static final String INTERIOR_COLOR_NAME = "interiorColorName";
    public static final String INTERIOR_COLOR_URL = "interiorColorUrl";
    public static final String INTERIOR_COLOR_PRICE = "interiorColorPrice";
    public static final String OPTIONS = "options";
    public static final String TOTAL_PRICE = "totalPrice";
    public static final String TEMPLATE = "template";
    public static final String IMAGE_001_PNG = "/image_001.png";
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
                        .car_image_url(exteriorColor.getExteriorImgUrl() + IMAGE_001_PNG)
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
                        .creationDate(LocalDateTime.now())
                        .build();
        pdfInfo = pdfRepository.save(pdfInfo);
        byte[] pdfBytes = generatePdf(pdfInfo.getId());
        MockMultipartFile pdfMultipartFile = new MockMultipartFile(PDF_ID, pdfBytes);
        String fileUrl = s3Service.saveFile(pdfMultipartFile, pdfInfo.getId());

        pdfInfo.setPdf_url(fileUrl);
        pdfRepository.save(pdfInfo);
        return new PdfIdResponse(pdfInfo.getId());
    }

    public PdfUrlResponse findPdf(String pdfId) {
        PdfInfo pdfInfo =
                pdfRepository
                        .findById(pdfId)
                        .orElseThrow(
                                () ->
                                        new MyCarDeepDiveException(
                                                HttpStatus.BAD_REQUEST, ErrorType.PDF_NOT_FOUND));
        return new PdfUrlResponse(pdfInfo.getPdf_url());
    }

    public byte[] generatePdf(String pdfId) throws IOException, DocumentException {
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
                MODEL_NAME,
                pdfInfo.getCar_name()
                        + BLANK
                        + pdfInfo.getEngine_name()
                        + BLANK
                        + pdfInfo.getTrim_name()
                        + BLANK
                        + pdfInfo.getBody_name());

        thymeleafContext.setVariable(CAR_IMG_URL, pdfInfo.getCar_image_url());
        thymeleafContext.setVariable(MODEL_PRICE, pdfInfo.getBasic_price());
        thymeleafContext.setVariable(MAX_POWER, pdfInfo.getMax_power());
        thymeleafContext.setVariable(MAX_TORQUE, pdfInfo.getMax_torque());
        thymeleafContext.setVariable(EXTERIOR_COLOR_NAME, pdfInfo.getExterior_color_name());
        thymeleafContext.setVariable(EXTERIOR_COLOR_URL, pdfInfo.getExterior_color_img_url());
        thymeleafContext.setVariable(EXTERIOR_COLOR_PRICE, pdfInfo.getExterior_color_price());
        thymeleafContext.setVariable(INTERIOR_COLOR_NAME, pdfInfo.getInterior_color_name());
        thymeleafContext.setVariable(INTERIOR_COLOR_URL, pdfInfo.getInterior_color_img_url());
        thymeleafContext.setVariable(INTERIOR_COLOR_PRICE, pdfInfo.getInterior_color_price());
        thymeleafContext.setVariable(OPTIONS, pdfInfo.getOptionList());

        long total_price =
                pdfInfo.getBasic_price()
                        + pdfInfo.getExterior_color_price()
                        + pdfInfo.getInterior_color_price()
                        + pdfInfo.getOptionList().stream()
                                .mapToLong(SimpleOption::getOption_price)
                                .sum();

        thymeleafContext.setVariable(TOTAL_PRICE, total_price);
        return templateEngine.process(TEMPLATE, thymeleafContext);
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
        pdfInfo.getExterior_color_price() + pdfInfo.getInterior_color_price() + 
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
