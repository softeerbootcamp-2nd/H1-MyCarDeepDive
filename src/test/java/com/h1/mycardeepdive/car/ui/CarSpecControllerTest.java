package com.h1.mycardeepdive.car.ui;

import static com.epages.restdocs.apispec.ResourceDocumentation.resource;
import static org.mockito.Mockito.when;
import static org.springframework.restdocs.operation.preprocess.Preprocessors.*;
import static org.springframework.restdocs.request.RequestDocumentation.parameterWithName;

import com.epages.restdocs.apispec.MockMvcRestDocumentationWrapper;
import com.epages.restdocs.apispec.ResourceSnippetParameters;
import com.h1.mycardeepdive.ControllerTestConfig;
import com.h1.mycardeepdive.car.service.CarSpecService;
import com.h1.mycardeepdive.car.ui.dto.CarSpecComparisonResponse;
import com.h1.mycardeepdive.car.ui.dto.CarSpecResponse;
import java.util.List;
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

@WebMvcTest(CarSpecController.class)
class CarSpecControllerTest extends ControllerTestConfig {
    private static final String DEFAULT_URL = "/api/v1/car-spec";

    @MockBean private CarSpecService carSpecService;

    @Test
    @DisplayName("특정 스펙의 모든 트림을 조회한다.")
    void findCarSpecsBySpec() throws Exception {
        // given
        String engineName = "diesel22";
        String bodyName = "7seats";
        String drivingSystemName = "2wd";

        MultiValueMap<String, String> info = new LinkedMultiValueMap<>();

        info.add("engine", engineName);
        info.add("body", bodyName);
        info.add("drivingSystem", drivingSystemName);

        when(carSpecService.findCarSpecsBySpec(engineName, bodyName, drivingSystemName))
                .thenReturn(
                        List.of(
                                CarSpecResponse.builder()
                                        .trim_name("Le Blanc")
                                        .price(43460000)
                                        .summary("필수적인 옵션만 모은")
                                        .car_spec_id(10L)
                                        .trim_id(2L)
                                        .basic_option_names(
                                                List.of(
                                                        "전방 충돌 방지 보조",
                                                        "내비 기반 크루즈 컨트롤",
                                                        "세이프티 파워 윈도우"))
                                        .basic_option_ids(List.of(1L, 2L, 3L))
                                        .build()));

        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(
                                                DEFAULT_URL
                                                        + "?engine=diesel22&body=7seats&drivingSystem=2wd")
                                        .params(info)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "trim-docs",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("트림")
                                                        .description("트림 조회")
                                                        .requestFields()
                                                        .requestParameters(
                                                                parameterWithName("engine")
                                                                        .description("엔진이름"),
                                                                parameterWithName("body")
                                                                        .description("바디이름"),
                                                                parameterWithName("drivingSystem")
                                                                        .description("구동방식이름"))
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Test
    @DisplayName("특정 스펙의 모든 트림을 비교하는 정보를 제공한다.")
    void findCarSpecComparisonsBySpec() throws Exception {
        // given
        String engine = "diesel22";
        String body = "7seats";
        String drivingSystem = "2wd";

        MultiValueMap<String, String> info = new LinkedMultiValueMap<>();

        info.add("engine", engine);
        info.add("body", body);
        info.add("drivingSystem", drivingSystem);

        when(carSpecService.findCarSpecComparisonsBySpec(engine, body, drivingSystem))
                .thenReturn(
                        List.of(
                                CarSpecComparisonResponse.builder()
                                        .trims_img_url(
                                                "https://www.hyundai.com/contents/vr360/LX06/trim/DS.png")
                                        .summary("필수적인 옵션만 모은")
                                        .trim_name("Le Blanc")
                                        .price(43460000)
                                        .exterior_color_img_urls(List.of())
                                        .interior_color_names(List.of())
                                        .wheel_size(20)
                                        .wheel_name("알로이 휠")
                                        .seat_name("퀄팅 천연가죽 시트")
                                        .navigation_size(12.3)
                                        .cluster_size(4.2)
                                        .basic_option_names(
                                                List.of(
                                                        "전방 충돌 방지 보조",
                                                        "내비 기반 크루즈 컨트롤",
                                                        "세이프티 파워 윈도우"))
                                        .basic_option_ids(List.of(1L, 2L, 3L))
                                        .build()));

        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(DEFAULT_URL + "/comparison")
                                        .params(info)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "trim-comparison",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("트림")
                                                        .description("트림 비교")
                                                        .requestFields()
                                                        .requestParameters(
                                                                parameterWithName("engine")
                                                                        .description("엔진이름"),
                                                                parameterWithName("body")
                                                                        .description("바디이름"),
                                                                parameterWithName("drivingSystem")
                                                                        .description("구동방식이름"))
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }
}
