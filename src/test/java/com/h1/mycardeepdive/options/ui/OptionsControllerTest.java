package com.h1.mycardeepdive.options.ui;

import static com.epages.restdocs.apispec.ResourceDocumentation.resource;
import static org.mockito.Mockito.when;
import static org.springframework.restdocs.operation.preprocess.Preprocessors.*;

import com.epages.restdocs.apispec.MockMvcRestDocumentationWrapper;
import com.epages.restdocs.apispec.ResourceSnippetParameters;
import com.h1.mycardeepdive.ControllerTestConfig;
import com.h1.mycardeepdive.options.service.OptionsService;
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
    private static final String DEFAULT_URL = "/api/v1/wheel-options";

    @MockBean private OptionsService optionsService;

    @BeforeEach
    void setup() {}

    @Test
    @DisplayName("휠의 모든 옵션 조회에 성공한다.")
    void getAllWheelOptions() throws Exception {

        // given
        when(optionsService.findAllWheelOptions())
                .thenReturn(
                        List.of(
                                new WheelOptionResponse(
                                        1L,
                                        12,
                                        "image.url",
                                        "엄청난 현대차의 휠",
                                        "현대차의 휠은 최강이다.",
                                        120000L,
                                        "히힣")));

        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(DEFAULT_URL)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "options-docs",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("휠 옵션")
                                                        .description("휠 옵션 목록 리스트 조회")
                                                        .requestFields()
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }
}
