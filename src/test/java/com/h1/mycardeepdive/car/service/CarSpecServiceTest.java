package com.h1.mycardeepdive.car.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

import com.h1.mycardeepdive.car.domain.*;
import com.h1.mycardeepdive.car.domain.repository.CarSpecRepository;
import com.h1.mycardeepdive.car.ui.dto.CarSpecComparisonResponse;
import com.h1.mycardeepdive.car.ui.dto.CarSpecResponse;
import com.h1.mycardeepdive.trims.domain.Trims;
import java.util.ArrayList;
import java.util.List;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class CarSpecServiceTest {
    @Mock private CarSpecRepository carSpecRepository;

    @InjectMocks private CarSpecService carSpecService;

    @Test
    @DisplayName("engineName, bodyName, drivingSystemName이 주어졌을 때 CarSpec을 찾을 수 있는 지 확인한다.")
    void findCarSpecsBySpec() {
        // given
        String engineName = "diesel22";
        String bodyName = "7seats";
        String drivingSystemName = "2wd";

        Engine engine = Engine.builder().id(1L).name(engineName).build();

        Body body = Body.builder().id(1L).name(bodyName).build();

        DrivingSystem drivingSystem =
                DrivingSystem.builder().id(1L).name(drivingSystemName).build();

        Trims trims = Trims.builder().id(1L).name("Le Blanc").summary("요약").build();

        CarSpec carSpec =
                CarSpec.builder()
                        .id(1L)
                        .engine(engine)
                        .body(body)
                        .drivingSystem(drivingSystem)
                        .trims(trims)
                        .price(1000000)
                        .build();

        when(carSpecRepository.findByEngine_nameAndDrivingSystem_nameAndBody_name(
                        engineName, bodyName, drivingSystemName))
                .thenReturn(List.of(carSpec));
        // when
        List<CarSpecResponse> carSpecResponses =
                carSpecService.findCarSpecsBySpec(engineName, drivingSystemName, bodyName);
        CarSpecResponse carSpecResponse = carSpecResponses.get(0);

        // then
        assertThat(carSpecResponse.getTrims_name()).isEqualTo(trims.getName());
        assertThat(carSpecResponse.getPrice()).isEqualTo(carSpec.getPrice());
        assertThat(carSpecResponse.getSummary()).isEqualTo(trims.getSummary());
        assertThat(carSpecResponse.getCar_spec_id()).isEqualTo(carSpec.getId());
        assertThat(carSpecResponse.getTrims_id()).isEqualTo(trims.getId());
        assertThat(carSpecResponse.getBasic_option_names()).isEqualTo(new ArrayList<>());
        assertThat(carSpecResponse.getBasic_option_ids()).isEqualTo(new ArrayList<>());
    }

    @Test
    @DisplayName(
            "engineName, bodyName, drivingSystemName이 주어졌을 때 List<CarSpecComparisonResponse>를 반환한다.")
    void findCarSpecComparisonsBySpec() {
        // given
        String engineName = "diesel22";
        String bodyName = "7seats";
        String drivingSystemName = "2wd";

        Engine engine = Engine.builder().id(1L).name(engineName).build();

        Body body = Body.builder().id(1L).name(bodyName).build();

        DrivingSystem drivingSystem =
                DrivingSystem.builder().id(1L).name(drivingSystemName).build();

        Trims trims =
                Trims.builder()
                        .id(1L)
                        .name("Le Blanc")
                        .summary("요약")
                        .car(Car.builder().build())
                        .clusterSize(12.3)
                        .description("설명")
                        .imgUrl("/trims/001.jpg")
                        .navigationSize(12.3)
                        .seatName("나파가죽 시트")
                        .trimsColorCombinations(null)
                        .wheelName("알로이 휠")
                        .build();

        CarSpec carSpec =
                CarSpec.builder()
                        .id(1L)
                        .engine(engine)
                        .body(body)
                        .drivingSystem(drivingSystem)
                        .trims(trims)
                        .price(1000000)
                        .build();

        when(carSpecRepository.findByEngine_nameAndDrivingSystem_nameAndBody_name(
                        engineName, bodyName, drivingSystemName))
                .thenReturn(List.of(carSpec));
        // when
        List<CarSpecComparisonResponse> carSpecComparisonResponses =
                carSpecService.findCarSpecComparisonsBySpec(
                        engineName, drivingSystemName, bodyName);
        CarSpecComparisonResponse carSpecComparisonResponse = carSpecComparisonResponses.get(0);

        // then
        assertThat(carSpecComparisonResponse.getTrims_img_url()).isEqualTo(trims.getImgUrl());
        assertThat(carSpecComparisonResponse.getSummary()).isEqualTo(trims.getSummary());
        assertThat(carSpecComparisonResponse.getTrims_name()).isEqualTo(trims.getName());
        assertThat(carSpecComparisonResponse.getPrice()).isEqualTo(carSpec.getPrice());
        assertThat(carSpecComparisonResponse.getExterior_color_img_urls())
                .isEqualTo(new ArrayList<>());
        assertThat(carSpecComparisonResponse.getInterior_color_names())
                .isEqualTo(new ArrayList<>());
        assertThat(carSpecComparisonResponse.getWheel_size()).isEqualTo(trims.getWheelSize());
        assertThat(carSpecComparisonResponse.getWheel_name()).isEqualTo(trims.getWheelName());
        assertThat(carSpecComparisonResponse.getSeat_name()).isEqualTo(trims.getSeatName());
        assertThat(carSpecComparisonResponse.getNavigation_size())
                .isEqualTo(trims.getNavigationSize());
        assertThat(carSpecComparisonResponse.getCluster_size()).isEqualTo(trims.getClusterSize());
        assertThat(carSpecComparisonResponse.getBasic_option_names()).isEqualTo(new ArrayList<>());
        assertThat(carSpecComparisonResponse.getBasic_option_ids()).isEqualTo(new ArrayList<>());
    }
}
