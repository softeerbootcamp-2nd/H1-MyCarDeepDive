package com.h1.mycardeepdive.car.service;

import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.car.domain.repository.CarSpecRepository;
import com.h1.mycardeepdive.car.ui.dto.CarSpecComparisonResponse;
import com.h1.mycardeepdive.car.ui.dto.CarSpecResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class CarSpecService {

    private final CarSpecRepository carSpecRepository;

    public List<CarSpecResponse> findCarSpecsBySpec(
            String engineName, String bodyName, String drivingSystemName) {
        List<CarSpec> carSpecs =
                carSpecRepository.findByEngine_engineNameAndDrivingSystem_drivingSystemNameAndBody_bodyName(engineName, drivingSystemName, bodyName);
        List<CarSpecResponse> carSpecResponses = new ArrayList<>();
        for (CarSpec carSpec : carSpecs) {
            CarSpecResponse carSpecResponse =
                    CarSpecResponse.builder()
                            .trims_name(carSpec.getTrims().getName())
                            .price(carSpec.getPrice())
                            .summary(carSpec.getTrims().getSummary())
                            .car_spec_id(carSpec.getId())
                            .trims_id(carSpec.getTrims().getId())
                            .basic_option_names(new ArrayList<>())
                            .basic_option_ids(new ArrayList<>())
                            .build();
            carSpecResponses.add(carSpecResponse);
        }
        return carSpecResponses;
    }

    public List<CarSpecComparisonResponse> findCarSpecComparisonsBySpec(
            String engineName, String bodyName, String drivingSystemName) {
        List<CarSpec> carSpecs =
                carSpecRepository.findByEngine_engineNameAndDrivingSystem_drivingSystemNameAndBody_bodyName(engineName, drivingSystemName, bodyName);
        List<CarSpecComparisonResponse> carSpecComparisonResponses = new ArrayList<>();
        for (CarSpec carSpec : carSpecs) {
            CarSpecComparisonResponse carSpecComparisonResponse =
                    CarSpecComparisonResponse.builder()
                            .trims_img_url(carSpec.getTrims().getImgUrl())
                            .summary(carSpec.getTrims().getSummary())
                            .trims_name(carSpec.getTrims().getName())
                            .price(carSpec.getPrice())
                            .exterior_color_img_urls(new ArrayList<>())
                            .interior_color_names(new ArrayList<>())
                            .wheel_size(carSpec.getTrims().getWheelSize())
                            .wheel_name(carSpec.getTrims().getWheelName())
                            .seat_name(carSpec.getTrims().getSeatName())
                            .navigation_size(carSpec.getTrims().getNavigationSize())
                            .cluster_size(carSpec.getTrims().getClusterSize())
                            .basic_option_names(new ArrayList<>())
                            .build();
            carSpecComparisonResponses.add(carSpecComparisonResponse);
        }
        return carSpecComparisonResponses;
    }
}
