package com.h1.mycardeepdive.color.ui;

import com.h1.mycardeepdive.color.service.ColorService;
import com.h1.mycardeepdive.color.ui.dto.ExteriorColorResponse;
import com.h1.mycardeepdive.color.ui.dto.InteriorColorResponse;
import com.h1.mycardeepdive.global.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/color")
public class ColorController {
    private final ColorService colorService;

    @GetMapping("/exterior-colors")
    public ApiResponse<ExteriorColorResponse> getExteriorColors(
            @RequestParam("trimId") Long trimId,
            @RequestParam("interiorColorId") Long interiorColorId) {
        ExteriorColorResponse exteriorColorResponse =
                colorService.findExteriorColors(trimId, interiorColorId);
        return new ApiResponse<>(exteriorColorResponse);
    }

    @GetMapping("/interior-colors")
    public ApiResponse<InteriorColorResponse> getInteriorColors(
            @RequestParam("trimId") Long trimId,
            @RequestParam("exteriorColorId") Long exteriorColorId) {
        InteriorColorResponse interiorColorResponse =
                colorService.findInteriorColors(trimId, exteriorColorId);
        return new ApiResponse<>(interiorColorResponse);
    }
}
