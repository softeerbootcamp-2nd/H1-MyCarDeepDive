package com.h1.mycardeepdive.car.service;

import static com.h1.mycardeepdive.fixture.BodyFixture.create7Body;
import static com.h1.mycardeepdive.fixture.CarSpecFixture.createCarSpecD72E;
import static com.h1.mycardeepdive.fixture.DrivingSystemFixture.create2WDDrivingSystem;
import static com.h1.mycardeepdive.fixture.EngineFixture.createDieselEngine;
import static com.h1.mycardeepdive.fixture.TrimFixture.createExclusiveTrim;
import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

import com.h1.mycardeepdive.car.domain.Body;
import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.car.domain.DrivingSystem;
import com.h1.mycardeepdive.car.domain.Engine;
import com.h1.mycardeepdive.car.domain.repository.CarSpecRepository;
import com.h1.mycardeepdive.car.ui.dto.CarSpecComparisonResponse;
import com.h1.mycardeepdive.car.ui.dto.CarSpecInfo;
import com.h1.mycardeepdive.car.ui.dto.CarSpecResponse;
import com.h1.mycardeepdive.trims.domain.Trim;
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
    @DisplayName("engineId, bodyId, drivingSystemId이 주어졌을 때 CarSpec들을 찾을 수 있는 지 확인한다.")
    void findCarSpecsBySpec() {
        // given
        Engine engine = createDieselEngine();
        Body body = create7Body();
        DrivingSystem drivingSystem = create2WDDrivingSystem();
        Trim trim = createExclusiveTrim();
        CarSpec carSpec = createCarSpecD72E();

        when(carSpecRepository.findByEngineIdAndBodyIdAndDrivingSystemId(
                        engine.getId(), body.getId(), drivingSystem.getId()))
                .thenReturn(List.of(carSpec));
        // when
        CarSpecResponse carSpecResponse =
                carSpecService.findCarSpecsBySpec(
                        engine.getId(), body.getId(), drivingSystem.getId());
        CarSpecInfo carSpecInfo = carSpecResponse.getCar_specs().get(0);

        // then
        assertThat(carSpecInfo.getTrim_name()).isEqualTo(trim.getName());
        assertThat(carSpecInfo.getPrice()).isEqualTo(carSpec.getPrice());
        assertThat(carSpecInfo.getSummary()).isEqualTo(trim.getSummary());
        assertThat(carSpecInfo.getCar_spec_id()).isEqualTo(carSpec.getId());
        assertThat(carSpecInfo.getTrim_id()).isEqualTo(trim.getId());
    }

    @Test
    @DisplayName("engineId, bodyId, drivingSystemId이 주어졌을 때 List<CarSpecComparisonResponse>를 반환한다.")
    void findCarSpecComparisonsBySpec() {
        // given
        Engine engine = createDieselEngine();
        Body body = create7Body();
        DrivingSystem drivingSystem = create2WDDrivingSystem();
        Trim trim = createExclusiveTrim();
        CarSpec carSpec = createCarSpecD72E();

        when(carSpecRepository.findByEngineIdAndBodyIdAndDrivingSystemId(
                        engine.getId(), body.getId(), drivingSystem.getId()))
                .thenReturn(List.of(carSpec));
        // when
        List<CarSpecComparisonResponse> carSpecComparisonResponses =
                carSpecService.findCarSpecComparisonsBySpec(
                        engine.getId(), body.getId(), drivingSystem.getId());
        CarSpecComparisonResponse carSpecComparisonResponse = carSpecComparisonResponses.get(0);

        // then
        assertThat(carSpecComparisonResponse.getTrims_img_url()).isEqualTo(trim.getImgUrl());
        assertThat(carSpecComparisonResponse.getSummary()).isEqualTo(trim.getSummary());
        assertThat(carSpecComparisonResponse.getTrim_name()).isEqualTo(trim.getName());
        assertThat(carSpecComparisonResponse.getPrice()).isEqualTo(carSpec.getPrice());
        assertThat(carSpecComparisonResponse.getWheel_size()).isEqualTo(trim.getWheelSize());
        assertThat(carSpecComparisonResponse.getWheel_name()).isEqualTo(trim.getWheelName());
        assertThat(carSpecComparisonResponse.getSeat_name()).isEqualTo(trim.getSeatName());
        assertThat(carSpecComparisonResponse.getNavigation_size())
                .isEqualTo(trim.getNavigationSize());
        assertThat(carSpecComparisonResponse.getCluster_size()).isEqualTo(trim.getClusterSize());
    }

    @DisplayName("트림 로그 전송에 성공한다.")
    @Test
    void sendUserTrimClickLog() {
        // given
        Trim trim = createExclusiveTrim();
        boolean result = carSpecService.userClickedTrimLog(trim.getId());

        // when&then
        assertTrue(result);
    }
}
