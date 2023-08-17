package com.h1.mycardeepdive.color.ui;

import static com.epages.restdocs.apispec.ResourceDocumentation.resource;
import static org.mockito.Mockito.when;
import static org.springframework.restdocs.operation.preprocess.Preprocessors.*;
import static org.springframework.restdocs.request.RequestDocumentation.parameterWithName;

import com.epages.restdocs.apispec.MockMvcRestDocumentationWrapper;
import com.epages.restdocs.apispec.ResourceSnippetParameters;
import com.h1.mycardeepdive.ControllerTestConfig;
import com.h1.mycardeepdive.color.service.ColorService;
import com.h1.mycardeepdive.color.ui.dto.ExteriorColorInfo;
import com.h1.mycardeepdive.color.ui.dto.ExteriorColorResponse;
import com.h1.mycardeepdive.color.ui.dto.InteriorColorInfo;
import com.h1.mycardeepdive.color.ui.dto.InteriorColorResponse;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.restdocs.mockmvc.RestDocumentationRequestBuilders;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

@WebMvcTest(ColorController.class)
class ColorControllerTest extends ControllerTestConfig {
    private static final String DEFAULT_URL = "/api/v1/color";

    @MockBean private ColorService colorService;

    @Test
    @DisplayName("사용가능한 외장컬러와 불가능한 외장컬러를 조회한다.")
    void getExteriorColors() throws Exception {
        // given
        Long trimId = 1L;
        Long interiorId = 1L;

        MultiValueMap<String, String> info = new LinkedMultiValueMap<>();

        info.add("trimId", String.valueOf(trimId));
        info.add("interiorColorId", String.valueOf(interiorId));

        ExteriorColorInfo exteriorColorInfo =
                ExteriorColorInfo.builder()
                        .name("그라파이트 그레이 메탈릭")
                        .price(100000)
                        .img_url("/exterior-color/icon/22.jpg")
                        .car_img_urls(
                                IntStream.rangeClosed(1, 60)
                                        .mapToObj(
                                                number ->
                                                        "/exterior-color"
                                                                + String.format(
                                                                        "/%03d.jpg", number))
                                        .collect(Collectors.toList()))
                        .trim_name("Calligraphy")
                        .build();
        when(colorService.findExteriorColors(trimId, interiorId))
                .thenReturn(
                        ExteriorColorResponse.builder()
                                .available_colors(List.of(exteriorColorInfo, exteriorColorInfo))
                                .unavailable_colors(List.of(exteriorColorInfo, exteriorColorInfo))
                                .other_trim_colors(List.of(exteriorColorInfo, exteriorColorInfo))
                                .build());
        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(
                                                DEFAULT_URL + "/exterior-colors")
                                        .params(info)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "외장",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("컬러")
                                                        .description("외장 컬러 조회")
                                                        .requestFields()
                                                        .requestParameters(
                                                                parameterWithName("trimId")
                                                                        .description("트림id"),
                                                                parameterWithName("interiorColorId")
                                                                        .description("내장색상id"))
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Test
    @DisplayName("사용가능한 내장컬러와 불가능한 내장컬러를 조회한다.")
    void getInteriorColors() throws Exception {
        // given
        Long trimId = 1L;
        Long exteriorId = 1L;

        MultiValueMap<String, String> info = new LinkedMultiValueMap<>();

        info.add("trimId", String.valueOf(trimId));
        info.add("exteriorColorId", String.valueOf(exteriorId));

        InteriorColorInfo interiorColorInfo =
                InteriorColorInfo.builder()
                        .name("퀼팅천연 (블랙)")
                        .price(100000)
                        .img_url("/interior-color/icon/22.jpg")
                        .car_img_url("/interior-color/22.jpg")
                        .trim_name("Calligraphy")
                        .build();
        when(colorService.findInteriorColors(trimId, exteriorId))
                .thenReturn(
                        InteriorColorResponse.builder()
                                .available_colors(List.of(interiorColorInfo, interiorColorInfo))
                                .unavailable_colors(List.of(interiorColorInfo, interiorColorInfo))
                                .other_trim_colors(List.of(interiorColorInfo, interiorColorInfo))
                                .build());
        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(
                                                DEFAULT_URL + "/interior-colors")
                                        .params(info)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "내장",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("컬러")
                                                        .description("내장 컬러 조회")
                                                        .requestFields()
                                                        .requestParameters(
                                                                parameterWithName("trimId")
                                                                        .description("트림id"),
                                                                parameterWithName("exteriorColorId")
                                                                        .description("외장색상id"))
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }
}
