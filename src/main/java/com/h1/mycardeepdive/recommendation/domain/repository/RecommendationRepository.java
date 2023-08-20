package com.h1.mycardeepdive.recommendation.domain.repository;

import com.h1.mycardeepdive.recommendation.domain.Recommendation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RecommendationRepository extends JpaRepository<Recommendation, Long> {
    Optional<Recommendation> findByAgeGroupIdAndLifeStyleId(Long ageGroupId, Long lifeStyleId);
}
