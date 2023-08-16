package com.h1.mycardeepdive.car.service;

import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.car.domain.repository.CarSpecRepository;
import com.h1.mycardeepdive.car.ui.dto.CarSpecComparisonResponse;
import com.h1.mycardeepdive.car.ui.dto.CarSpecResponse;
import com.h1.mycardeepdive.trims.domain.Trim;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class CarSpecService {

    private final CarSpecRepository carSpecRepository;

    public List<CarSpecResponse> findCarSpecsBySpec(
            String engineName, String bodyName, String drivingSystemName) {
        List<CarSpec> carSpecs =
                carSpecRepository.findByEngine_nameAndBody_nameAndDrivingSystem_name(
                        engineName, bodyName, drivingSystemName);
        List<CarSpecResponse> carSpecResponses = new ArrayList<>();
        for (CarSpec carSpec : carSpecs) {
            Trim trim = carSpec.getTrim();
            CarSpecResponse carSpecResponse =
                    CarSpecResponse.builder()
                            .trim_name(trim.getName())
                            .price(carSpec.getPrice())
                            .summary(trim.getSummary())
                            .car_spec_id(carSpec.getId())
                            .trim_id(trim.getId())
                            .basic_option_names(getBasicOptionNames(trim.getId()))
                            .basic_option_ids(getBasicOptionIds(trim.getId()))
                            .build();
            carSpecResponses.add(carSpecResponse);
        }
        return carSpecResponses;
    }

    public List<CarSpecComparisonResponse> findCarSpecComparisonsBySpec(
            String engineName, String bodyName, String drivingSystemName) {
        List<CarSpec> carSpecs =
                carSpecRepository.findByEngine_nameAndBody_nameAndDrivingSystem_name(
                        engineName, bodyName, drivingSystemName);
        List<CarSpecComparisonResponse> carSpecComparisonResponses = new ArrayList<>();
        for (CarSpec carSpec : carSpecs) {
            Trim trim = carSpec.getTrim();
            CarSpecComparisonResponse carSpecComparisonResponse =
                    CarSpecComparisonResponse.builder()
                            .trims_img_url(trim.getImgUrl())
                            .summary(trim.getSummary())
                            .trim_name(trim.getName())
                            .price(carSpec.getPrice())
                            .exterior_color_img_urls(new ArrayList<>())
                            .interior_color_names(new ArrayList<>())
                            .wheel_size(trim.getWheelSize())
                            .wheel_name(trim.getWheelName())
                            .seat_name(trim.getSeatName())
                            .navigation_size(trim.getNavigationSize())
                            .cluster_size(trim.getClusterSize())
                            .basic_option_names(getBasicOptionNames(trim.getId()))
                            .basic_option_ids(getBasicOptionIds(trim.getId()))
                            .build();
            carSpecComparisonResponses.add(carSpecComparisonResponse);
        }
        return carSpecComparisonResponses;
    }

    private List<String> getBasicOptionNames(Long trimId) {
        if (trimId == 1) {
            return List.of("전방 충돌 방지 보조", "내비 기반 크루즈 컨트롤", "세이프티 파워 윈도우");
        } else if (trimId == 2) {
            return List.of("퀼팅 천연가죽 시트", "12인치 클러스터", "서라운드 뷰 모니터");
        } else if (trimId == 3) {
            return List.of("2열 통풍시트", "스마트 자세제어", "2열 수동식 도어 커튼");
        } else {
            return List.of("20인치 캘리그라피 전용 휠", "KRELL 프리미엄 사운드", "원격 스마트 주차 보조");
        }
    }

    private List<Long> getBasicOptionIds(Long trimId) {
        if (trimId == 1) {
            return List.of(10L, 16L, 108L);
        } else if (trimId == 2) {
            return List.of(80L, 59L, 113L);
        } else if (trimId == 3) {
            return List.of(129L, 86L, 116L);
        } else {
            return List.of(52L, 127L, 27L);
        }
    }
}
