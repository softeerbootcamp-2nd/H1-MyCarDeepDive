package com.h1.mycardeepdive.options.ui;

import static com.epages.restdocs.apispec.ResourceDocumentation.resource;
import static org.mockito.Mockito.when;
import static org.springframework.restdocs.operation.preprocess.Preprocessors.*;

import com.epages.restdocs.apispec.MockMvcRestDocumentationWrapper;
import com.epages.restdocs.apispec.ResourceSnippetParameters;
import com.h1.mycardeepdive.ControllerTestConfig;
import com.h1.mycardeepdive.options.service.OptionsService;
import com.h1.mycardeepdive.options.ui.dto.AdditionalOptionResponse;
import com.h1.mycardeepdive.options.ui.dto.BasicOptionResponse;
import com.h1.mycardeepdive.options.ui.dto.OptionResponse;
import com.h1.mycardeepdive.options.ui.dto.PackageOptionResponse;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.restdocs.mockmvc.RestDocumentationRequestBuilders;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

@WebMvcTest(OptionsController.class)
class OptionsControllerTest extends ControllerTestConfig {
    private static final String DEFAULT_URL = "/api/v1";

    @MockBean private OptionsService optionsService;

    @BeforeEach
    void setup() {}

    @DisplayName("차량 사양의 모든 추가 옵션을 조회에 성공한다.")
    @Test
    void getAllAdditionalOptions() throws Exception {
        // given
        Long carSpecId = 1L;
        when(optionsService.findAllAdditionalOptions(carSpecId))
                .thenReturn(
                        new OptionResponse(
                                List.of(
                                        new PackageOptionResponse(
                                                1L,
                                                "https://www.hyundai.co.kr/image/upload/asset_library/MDA00000000000000388/e435f2e0b5f246ccaa8ce260dac16c9b.jpg",
                                                10.12,
                                                "컴포트 II",
                                                "편의성을 위해 구성된 세트 옵션",
                                                List.of("대표", "주행안전"),
                                                "None",
                                                10090000)),
                                List.of(
                                        new AdditionalOptionResponse(
                                                1L,
                                                "https://img.etnews.com/photonews/2011/1352481_20201113164311_199_0001.jpg",
                                                5.5,
                                                "빌트인 캠(보조배터리 포함)",
                                                "차량 내부에 카메라를 설치하여 녹화가 가능한 블랙박스",
                                                List.of("대표", "주행안전"),
                                                "H Genuine Accessories",
                                                109000))));

        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(
                                                DEFAULT_URL
                                                        + "/car-spec/{car-spec-id}/additional-options",
                                                carSpecId)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "options-docs1",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("옵션")
                                                        .description("차량 사양에 따른 추가 옵션 목록 리스트 조회")
                                                        .requestFields()
                                                        .responseFields()
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }

    @DisplayName("차량 사양의 모든 기본 옵션을 조회에 성공한다.")
    @Test
    void getAllBasicOptions() throws Exception {
        // given
        Long carSpecId = 1L;
        when(optionsService.findAllBasicOptions(carSpecId))
                .thenReturn(
                        List.of(
                                new BasicOptionResponse(
                                        1L,
                                        "https://www.hyundai.co.kr/image/upload/asset_library/MDA00000000000000388/e435f2e0b5f246ccaa8ce260dac16c9b.jpg",
                                        "다중 충돌방지 자동 제동 시스템",
                                        List.of("대표", "주행안전"))));

        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(
                                                DEFAULT_URL
                                                        + "/car-spec/{car-spec-id}/basic-options",
                                                carSpecId)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "options-docs2",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("옵션")
                                                        .description("차량 사양에 따른 기본 옵션 목록 리스트 조회")
                                                        .requestFields()
                                                        .responseFields()
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }
}
