package com.h1.mycardeepdive.recommendation.domain;

import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class CustomRecommendation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "custom_recommendation_id")
    private Long id;

    private Long drivingExperienceId;

    private Long familyMembersId;

    private Long carPurposeId;

    private Long personalValueId;

    @ManyToOne
    @JoinColumn(name = "recommendation_car_id")
    private RecommendationCar recommendationCar;

    @Builder
    public CustomRecommendation(
            Long id,
            Long drivingExperienceId,
            Long familyMembersId,
            Long carPurposeId,
            Long personalValueid,
            RecommendationCar recommendationCar) {
        this.id = id;
        this.drivingExperienceId = drivingExperienceId;
        this.familyMembersId = familyMembersId;
        this.carPurposeId = carPurposeId;
        this.personalValueId = personalValueid;
        this.recommendationCar = recommendationCar;
    }
}
