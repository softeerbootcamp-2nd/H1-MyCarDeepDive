package com.h1.mycardeepdive.car.ui;

import static com.epages.restdocs.apispec.ResourceDocumentation.resource;
import static com.h1.mycardeepdive.car.mapper.CarSpecMapper.toCarSpecComparisonResponse;
import static com.h1.mycardeepdive.car.mapper.CarSpecMapper.toCarSpecResponse;
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
        Long engineId = 1L;
        Long bodyId = 1L;
        Long drivingSystemId = 1L;

        MultiValueMap<String, String> info = new LinkedMultiValueMap<>();
        info.add("engineId", String.valueOf(engineId));
        info.add("bodyId", String.valueOf(bodyId));
        info.add("drivingSystemId", String.valueOf(drivingSystemId));

        CarSpec carSpec = createCarSpecD72E();
        List<String> basicOptionNames = List.of("전방 충돌 방지 보조", "내비 기반 크루즈 컨트롤", "세이프티 파워 윈도우");
        List<Long> basicOptionIds = List.of(1L, 2L, 3L);

        CarSpecResponse carSpecResponse =
                toCarSpecResponse(carSpec, basicOptionNames, basicOptionIds);

        when(carSpecService.findCarSpecsBySpec(engineId, bodyId, drivingSystemId))
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
                                                                parameterWithName("engineId")
                                                                        .description(
                                                                                "디젤: 1, 가솔린: 2"),
                                                                parameterWithName("bodyId")
                                                                        .description(
                                                                                "7인승: 1, 8인승: 2"),
                                                                parameterWithName("drivingSystemId")
                                                                        .description(
                                                                                "2WD: 1, 4WD: 2"))
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Test
    @DisplayName("특정 스펙의 모든 트림을 비교하는 정보를 제공한다.")
    void findCarSpecComparisonsBySpec() throws Exception {
        // given
        Long engineId = 1L;
        Long bodyId = 1L;
        Long drivingSystemId = 1L;

        MultiValueMap<String, String> info = new LinkedMultiValueMap<>();
        info.add("engineId", String.valueOf(engineId));
        info.add("bodyId", String.valueOf(bodyId));
        info.add("drivingSystemId", String.valueOf(drivingSystemId));

        CarSpec carSpec = createCarSpecD72E();
        List<String> basicOptionNames = List.of("전방 충돌 방지 보조", "내비 기반 크루즈 컨트롤", "세이프티 파워 윈도우");
        List<Long> basicOptionIds = List.of(1L, 2L, 3L);

        CarSpecComparisonResponse carSpecComparisonResponse =
                toCarSpecComparisonResponse(carSpec, basicOptionNames, basicOptionIds);
        when(carSpecService.findCarSpecComparisonsBySpec(engineId, bodyId, drivingSystemId))
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
                                                                parameterWithName("engineId")
                                                                        .description(
                                                                                "디젤: 1, 가솔린: 2"),
                                                                parameterWithName("bodyId")
                                                                        .description(
                                                                                "7인승: 1, 8인승: 2"),
                                                                parameterWithName("drivingSystemId")
                                                                        .description(
                                                                                "2WD: 1, 4WD: 2"))
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }

    @DisplayName("트림 로그 전송 기능에 성공한다.")
    @Test
    void clickTrimLogTest() throws Exception {
        // given
        Long trimId = 1L;
        when(carSpecService.userClickedTrimLog(trimId)).thenReturn(true);

        // then
        ResultActions resultActions =
                mockMvc.perform(
                                RestDocumentationRequestBuilders.post(
                                                DEFAULT_URL + "/activity-log/{trim-id}", trimId)
                                        .contentType(MediaType.APPLICATION_JSON)
                                        .accept(MediaType.APPLICATION_JSON))
                        .andDo(
                                MockMvcRestDocumentationWrapper.document(
                                        "trim-click",
                                        preprocessRequest(prettyPrint()),
                                        preprocessResponse(prettyPrint()),
                                        resource(
                                                ResourceSnippetParameters.builder()
                                                        .tag("트림")
                                                        .description("트림 클릭 시, 로그 전송")
                                                        .requestFields()
                                                        .responseFields()
                                                        .build())));
        resultActions.andExpect(MockMvcResultMatchers.status().isOk());
    }
}
