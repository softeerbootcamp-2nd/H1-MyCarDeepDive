package com.h1.mycardeepdive.recommendation.service;

import static com.h1.mycardeepdive.recommendation.mapper.RecommendationMapper.toRecommendationResponse;

import com.h1.mycardeepdive.exception.ErrorType;
import com.h1.mycardeepdive.exception.MyCarDeepDiveException;
import com.h1.mycardeepdive.recommendation.domain.CustomRecommendation;
import com.h1.mycardeepdive.recommendation.domain.CustomRecommendationCar;
import com.h1.mycardeepdive.recommendation.domain.Recommendation;
import com.h1.mycardeepdive.recommendation.domain.repository.CustomRecommendationRepository;
import com.h1.mycardeepdive.recommendation.domain.repository.RecommendationRepository;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationResponse;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class RecommendationService {

    private final RecommendationRepository recommendationRepository;
    private final CustomRecommendationRepository customRecommendationRepository;

    public RecommendationResponse findRecommendation(Long ageGroupId, Long lifeStyleId) {
        Recommendation recommendation =
                recommendationRepository
                        .findByAgeGroupIdAndLifeStyleId(ageGroupId, lifeStyleId)
                        .orElseThrow(
                                () ->
                                        new MyCarDeepDiveException(
                                                HttpStatus.BAD_REQUEST,
                                                ErrorType.RECOMMENDATION_NOT_FOUND));
        return toRecommendationResponse(recommendation.getRecommendationCar(), recommendation);
    }

    public RecommendationResponse findCustomRecommendation(
            Long drivingExperienceId,
            Long familyMembersId,
            Long carPurposeId,
            Long personalValueId,
            Long maxBudget) {
        CustomRecommendation customRecommendation =
                customRecommendationRepository
                        .findByDrivingExperienceIdAndFamilyMembersIdAndCarPurposeIdAndPersonalValueId(
                                drivingExperienceId,
                                familyMembersId,
                                carPurposeId,
                                personalValueId);
        List<CustomRecommendationCar> customRecommendationCars =
                customRecommendation.getCustomRecommendationCars();
        for (CustomRecommendationCar customRecommendationCar : customRecommendationCars) {
            long price = customRecommendationCar.getRecommendationCar().getPrice();
            // todo(조건분기 메서드 분리)
            if (price < maxBudget) {
                return toRecommendationResponse(customRecommendationCar.getRecommendationCar());
            }
        }
        return toRecommendationResponse(
                customRecommendationCars.stream().findAny().orElseThrow().getRecommendationCar());
    }
}
