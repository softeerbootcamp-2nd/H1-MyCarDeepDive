package com.h1.mycardeepdive.recommendation.service;

import static com.h1.mycardeepdive.recommendation.mapper.RecommendationMapper.toRecommendationResponse;

import com.h1.mycardeepdive.recommendation.domain.CustomRecommendation;
import com.h1.mycardeepdive.recommendation.domain.Recommendation;
import com.h1.mycardeepdive.recommendation.domain.repository.CustomRecommendationRepository;
import com.h1.mycardeepdive.recommendation.domain.repository.RecommendationRepository;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
                        .orElseThrow();
        return toRecommendationResponse(recommendation.getRecommendationCar(), recommendation);
    }

    public RecommendationResponse findCustomRecommendation(
            Long drivingExperienceId,
            Long familyMembersId,
            Long carPurposeId,
            Long personalValueId) {
        CustomRecommendation customRecommendation =
                customRecommendationRepository
                        .findByDrivingExperienceIdAndFamilyMembersIdAndCarPurposeIdAndPersonalValueId(
                                drivingExperienceId,
                                familyMembersId,
                                carPurposeId,
                                personalValueId);
        return toRecommendationResponse(customRecommendation.getRecommendationCar());
    }
}
