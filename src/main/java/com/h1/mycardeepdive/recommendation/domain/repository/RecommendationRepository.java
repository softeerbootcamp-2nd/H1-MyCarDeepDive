package com.h1.mycardeepdive.recommendation.domain.repository;

import com.h1.mycardeepdive.recommendation.domain.Recommendation;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RecommendationRepository extends JpaRepository<Recommendation, Long> {
    Optional<Recommendation> findByAgeGroupIdAndLifeStyleId(Long ageGroupId, Long lifeStyleId);
}
