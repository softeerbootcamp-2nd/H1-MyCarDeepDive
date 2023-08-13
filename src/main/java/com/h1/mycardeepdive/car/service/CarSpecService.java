package com.h1.mycardeepdive.car.service;

import com.h1.mycardeepdive.car.domain.Body;
import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.car.domain.DrivingSystem;
import com.h1.mycardeepdive.car.domain.Engine;
import com.h1.mycardeepdive.car.domain.repository.BodyRepository;
import com.h1.mycardeepdive.car.domain.repository.CarSpecRepository;
import com.h1.mycardeepdive.car.domain.repository.DrivingSystemRepository;
import com.h1.mycardeepdive.car.domain.repository.EngineRepository;
import com.h1.mycardeepdive.car.ui.dto.CarSpecComparisonResponse;
import com.h1.mycardeepdive.car.ui.dto.CarSpecResponse;
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
    private final EngineRepository engineRepository;
    private final BodyRepository bodyRepository;
    private final DrivingSystemRepository drivingSystemRepository;

    public List<CarSpecResponse> findCarSpecsBySpec(
            String engineName, String bodyName, String drivingSystemName) {
        Engine engine = engineRepository.findByName(engineName);
        Body body = bodyRepository.findByName(bodyName);
        DrivingSystem drivingSystem = drivingSystemRepository.findByName(drivingSystemName);
        List<CarSpec> carSpecs =
                carSpecRepository.findByEngineAndDrivingSystemAndBody(engine, drivingSystem, body);
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
        Engine engine = engineRepository.findByName(engineName);
        Body body = bodyRepository.findByName(bodyName);
        DrivingSystem drivingSystem = drivingSystemRepository.findByName(drivingSystemName);
        List<CarSpec> carSpecs =
                carSpecRepository.findByEngineAndDrivingSystemAndBody(engine, drivingSystem, body);
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
