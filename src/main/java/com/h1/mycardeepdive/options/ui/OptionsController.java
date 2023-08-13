package com.h1.mycardeepdive.options.ui;

import com.h1.mycardeepdive.global.response.ApiResponse;
import com.h1.mycardeepdive.options.service.OptionsService;
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

}
