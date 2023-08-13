package com.h1.mycardeepdive.options.ui;

import com.h1.mycardeepdive.global.response.ApiResponse;
import com.h1.mycardeepdive.options.service.OptionsService;
import com.h1.mycardeepdive.options.ui.dto.BasicOptionResponse;
import com.h1.mycardeepdive.options.ui.dto.OptionDetailResponse;
import com.h1.mycardeepdive.options.ui.dto.OptionResponse;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1")
public class OptionsController {
    private final OptionsService optionsService;

    @GetMapping("/car-spec/{car-spec-id}/additional-options")
    public ApiResponse<OptionResponse> getAllAdditionalOptions(
            @PathVariable("car-spec-id") Long carSpecId) {
        return new ApiResponse<>(optionsService.findAllAdditionalOptions(carSpecId));
    }

    @GetMapping("/car-spec/{car-spec-id}/basic-options")
    public ApiResponse<List<BasicOptionResponse>> getAllBasicOptions(
            @PathVariable("car-spec-id") Long carSpecId) {
        return new ApiResponse<>(optionsService.findAllBasicOptions(carSpecId));
    }

    @PostMapping("/options/activity-log/{option-id}")
    public ApiResponse<Boolean> userClickedOptionLog(@PathVariable("option-id") Long optionId) {
        return new ApiResponse<>(optionsService.userClickedOptionLog(optionId));
    }

    @PostMapping("/package-options/activity-log/{option-id}")
    public ApiResponse<Boolean> userClickedPackageLog(@PathVariable("option-id") Long optionId) {
        return new ApiResponse<>(optionsService.userClickedPackageLog(optionId));
    }

    @GetMapping("/options/package/{option-id}/details")
    public ApiResponse<List<OptionDetailResponse>> getPackageOptionDetail(
            @PathVariable("option-id") Long optionId) {
        return new ApiResponse<>(optionsService.findPackageOptionDetail(optionId));
    }

    @GetMapping("/options/{option-id}/details")
    public ApiResponse<OptionDetailResponse> getOptionDetail(
            @PathVariable("option-id") Long optionId) {
        return new ApiResponse<>(optionsService.findOptionDetail(optionId));
    }
}
