package com.h1.mycardeepdive.car.ui;

import com.h1.mycardeepdive.car.service.CarSpecService;
import com.h1.mycardeepdive.car.ui.dto.CarSpecComparisonResponse;
import com.h1.mycardeepdive.car.ui.dto.CarSpecResponse;
import com.h1.mycardeepdive.global.response.ApiResponse;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/car-spec")
public class CarSpecController {
    private final CarSpecService carSpecService;

    @GetMapping
    public ApiResponse<List<CarSpecResponse>> getTrimsBySpec(
            @RequestParam("engine") String engineName,
            @RequestParam("body") String bodyName,
            @RequestParam("drivingSystem") String drivingSystemName) {
        List<CarSpecResponse> carSpecs =
                carSpecService.findCarSpecsBySpec(engineName, bodyName, drivingSystemName);
        return new ApiResponse<>(carSpecs);
    }

    @GetMapping("/comparison")
    public ApiResponse<List<CarSpecComparisonResponse>> getComparison(
            @RequestParam("engine") String engineName,
            @RequestParam("body") String bodyName,
            @RequestParam("drivingSystem") String drivingSystemName) {
        List<CarSpecComparisonResponse> carSpecComparisons =
                carSpecService.findCarSpecComparisonsBySpec(
                        engineName, bodyName, drivingSystemName);
        return new ApiResponse<>(carSpecComparisons);
    }
}
