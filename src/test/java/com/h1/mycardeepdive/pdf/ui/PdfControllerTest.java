package com.h1.mycardeepdive.pdf.ui;

import static com.epages.restdocs.apispec.ResourceDocumentation.resource;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;
import static org.springframework.restdocs.operation.preprocess.Preprocessors.*;
import static org.springframework.restdocs.operation.preprocess.Preprocessors.prettyPrint;

import com.epages.restdocs.apispec.MockMvcRestDocumentationWrapper;
import com.epages.restdocs.apispec.ResourceSnippetParameters;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.h1.mycardeepdive.ControllerTestConfig;
import com.h1.mycardeepdive.options.ui.dto.*;
import com.h1.mycardeepdive.pdf.service.MailServiceImpl;
import com.h1.mycardeepdive.pdf.service.PdfService;
import com.h1.mycardeepdive.pdf.ui.dto.*;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.restdocs.mockmvc.RestDocumentationRequestBuilders;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

@WebMvcTest(PdfController.class)
class PdfControllerTest extends ControllerTestConfig {
    private static final String DEFAULT_URL = "/api/v1";

    @MockBean private PdfService pdfService;

    @MockBean private MailServiceImpl mailService;
    @Autowired private ObjectMapper objectMapper;

    @BeforeEach
    void setup() {}

    @DisplayName("pdfId를 바탕으로 이메일을 보낼 수 있다.")
    @Test
    void sendEmailTest() throws Exception {
        // given
        String pdfId = "64e231fe2d19c0147d010b21";
        String email = "mycardeepdiveto@test.com";
        when(mailService.createMessage(email, pdfId)).thenReturn(true);

        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(
                                                DEFAULT_URL + "/pdf/{pdf-id}/email/{email-name}",
                                                pdfId,
                                                email)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "PDF-EMAIL",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("PDF")
                                                        .description("pdfId를 통해 이메일을 전송합니다.")
                                                        .requestFields()
                                                        .responseFields()
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }

    @DisplayName("pdfId(String)를 요청합니다.")
    @Test
    void getPDFIdTest() throws Exception {
        // given
        PdfIdRequest pdfIdRequest = new PdfIdRequest(1L, 1L, 1L, 1L, List.of(1L, 3L, 4L));
        when(pdfService.registerPdfId(pdfIdRequest))
                .thenReturn(new PdfIdResponse("64e231fe2d19c0147d010b21"));

        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.post(DEFAULT_URL + "/pdfId")
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .content(objectMapper.writeValueAsString(pdfIdRequest))
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "PDF-PDFID",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("PDF")
                                                        .description(
                                                                "pdfId(String 형태)를 요청합니다. pdfId가 있어야 다른 api가 조회가능합니다.")
                                                        .requestFields()
                                                        .responseFields()
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }

    @DisplayName("pdfId로부터 pdfURL을 요청합니다.")
    @Test
    void getPdfURLTest() throws Exception {
        // given
        String pdfId = "64e231fe2d19c0147d010b21";
        when(pdfService.findPdf(pdfId))
                .thenReturn(
                        new PdfUrlResponse("pdf.make-my-car.shop/64e231fe2d19c0147d010b21.pdf"));

        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(
                                                DEFAULT_URL + "/pdf/{pdf-id}", pdfId)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "PDF-PDFURL",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("PDF")
                                                        .description(
                                                                "pdfurl를 요청합니다. pdfId가 있어야 다른 api가 조회가능합니다.")
                                                        .requestFields()
                                                        .responseFields()
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }

    @DisplayName("pdfId로부터 차량 정보를 요청합니다.")
    @Test
    void getCarInformationTest() throws Exception {
        // given
        CarInformation carinfo =
                new CarInformation(
                        "팰리세이드",
                        "디젤 2.2",
                        "4WD",
                        "LeBlanc",
                        "8인승",
                        "크리미 화이트 펄",
                        "exterior_img.url",
                        100000,
                        "인조가죽(블랙)",
                        "interior_img.url",
                        0,
                        List.of(
                                new SimpleOption("컴포트II", 100000L, "option_img_url1"),
                                new SimpleOption("컴포트II", 100000L, "option_img_url1")),
                        10000,
                        "pdf.url",
                        1000000L);

        String pdfId = "64e231fe2d19c0147d010b21";
        when(pdfService.findCarInformation(pdfId)).thenReturn(carinfo);

        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(
                                                DEFAULT_URL + "/pdf/{pdf-id}/car-information",
                                                pdfId)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "PDF-CARINFO",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("PDF")
                                                        .description(
                                                                "pdfId로부터 차량 정보를 요청합니다. pdfId가 있어야 다른 api가 조회가능합니다.")
                                                        .requestFields()
                                                        .responseFields()
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }
}
