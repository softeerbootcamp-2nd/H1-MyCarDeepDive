package com.h1.mycardeepdive.recommendation.service;

import com.h1.mycardeepdive.recommendation.domain.Recommendation;
import com.h1.mycardeepdive.recommendation.domain.repository.RecommendationRepository;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.h1.mycardeepdive.recommendation.mapper.RecommendationMapper.toRecommendationResponse;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class RecommendationService {

    private final RecommendationRepository recommendationRepository;

    public RecommendationResponse findRecommendation(Long ageGroupId, Long lifeStyleId) {
        Recommendation recommendation = recommendationRepository.findByAgeGroupIdAndLifeStyleId(ageGroupId, lifeStyleId).orElseThrow();
        return toRecommendationResponse(recommendation);
    }
}
