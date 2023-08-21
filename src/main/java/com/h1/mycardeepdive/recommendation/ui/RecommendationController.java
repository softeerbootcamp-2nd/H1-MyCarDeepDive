package com.h1.mycardeepdive.recommendation.ui;

import com.h1.mycardeepdive.global.response.ApiResponse;
import com.h1.mycardeepdive.recommendation.service.RecommendationService;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/car-recommendation")
public class RecommendationController {
    private final RecommendationService recommendationService;

    @GetMapping
    public ApiResponse<RecommendationResponse> getRecommendation(
            @RequestParam("ageGroupId") Long ageGroupId,
            @RequestParam("lifeStyleId") Long lifeStyleId) {
        RecommendationResponse recommendation =
                recommendationService.findRecommendation(ageGroupId, lifeStyleId);
        return new ApiResponse<>(recommendation);
    }

    @GetMapping("/custom")
    public ApiResponse<RecommendationResponse> getCustomRecommendation(
            @RequestParam("drivingExperienceId") Long drivingExperienceId,
            @RequestParam("familyMembersId") Long familyMembersId,
            @RequestParam("carPurposeId") Long carPurposeId,
            @RequestParam("personalValueId") Long personalValueId,
            @RequestParam("maxBudget") Long maxBudget) {
        RecommendationResponse recommendation =
                recommendationService.findCustomRecommendation(
                        drivingExperienceId, familyMembersId, carPurposeId, personalValueId);
        return new ApiResponse<>(recommendation);
    }
}
