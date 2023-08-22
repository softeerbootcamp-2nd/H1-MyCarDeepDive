package com.h1.mycardeepdive.recommendation.domain.repository;

import com.h1.mycardeepdive.recommendation.domain.CustomRecommendation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomRecommendationRepository extends JpaRepository<CustomRecommendation, Long> {
    CustomRecommendation
            findByDrivingExperienceIdAndFamilyMembersIdAndCarPurposeIdAndPersonalValueId(
                    Long drivingExperienceId,
                    Long familyMembersId,
                    Long carPurposeId,
                    Long personalValueId);
}
