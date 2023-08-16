package com.h1.mycardeepdive.car.ui;

import static com.epages.restdocs.apispec.ResourceDocumentation.resource;
import static com.h1.mycardeepdive.fixture.CarSpecFixture.createCarSpecD72E;
import static org.mockito.Mockito.when;
import static org.springframework.restdocs.operation.preprocess.Preprocessors.*;
import static org.springframework.restdocs.request.RequestDocumentation.parameterWithName;

import com.epages.restdocs.apispec.MockMvcRestDocumentationWrapper;
import com.epages.restdocs.apispec.ResourceSnippetParameters;
import com.h1.mycardeepdive.ControllerTestConfig;
import com.h1.mycardeepdive.car.domain.CarSpec;
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

        CarSpec carSpec = createCarSpecD72E();
        List<String> basicOptionNames = List.of("전방 충돌 방지 보조", "내비 기반 크루즈 컨트롤", "세이프티 파워 윈도우");
        List<Long> basicOptionIds = List.of(1L, 2L, 3L);

        CarSpecResponse carSpecResponse =
                CarSpecResponse.builder()
                        .trim_name(carSpec.getTrim().getName())
                        .price(carSpec.getPrice())
                        .summary(carSpec.getTrim().getSummary())
                        .car_spec_id(carSpec.getId())
                        .trim_id(carSpec.getTrim().getId())
                        .basic_option_names(basicOptionNames)
                        .basic_option_ids(basicOptionIds)
                        .build();

        when(carSpecService.findCarSpecsBySpec(engineName, bodyName, drivingSystemName))
                .thenReturn(
                        List.of(
                                carSpecResponse,
                                carSpecResponse,
                                carSpecResponse,
                                carSpecResponse));

        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.get(DEFAULT_URL)
                                        .params(info)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "all-trims",
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

        CarSpec carSpec = createCarSpecD72E();
        List<String> basicOptionNames = List.of("전방 충돌 방지 보조", "내비 기반 크루즈 컨트롤", "세이프티 파워 윈도우");
        List<Long> basicOptionIds = List.of(1L, 2L, 3L);

        CarSpecComparisonResponse carSpecComparisonResponse =
                CarSpecComparisonResponse.builder()
                        .trims_img_url(carSpec.getTrim().getImgUrl())
                        .summary(carSpec.getTrim().getSummary())
                        .trim_name(carSpec.getTrim().getName())
                        .price(carSpec.getPrice())
                        .exterior_color_img_urls(List.of())
                        .interior_color_names(List.of())
                        .wheel_size(carSpec.getTrim().getWheelSize())
                        .wheel_name(carSpec.getTrim().getWheelName())
                        .seat_name(carSpec.getTrim().getSeatName())
                        .navigation_size(carSpec.getTrim().getNavigationSize())
                        .cluster_size(carSpec.getTrim().getClusterSize())
                        .basic_option_names(basicOptionNames)
                        .basic_option_ids(basicOptionIds)
                        .build();
        when(carSpecService.findCarSpecComparisonsBySpec(engine, body, drivingSystem))
                .thenReturn(
                        List.of(
                                carSpecComparisonResponse,
                                carSpecComparisonResponse,
                                carSpecComparisonResponse,
                                carSpecComparisonResponse));

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
