package com.h1.mycardeepdive.recommendation.domain;

import java.util.List;
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

    @OneToMany(mappedBy = "customRecommendation", fetch = FetchType.LAZY)
    private List<CustomRecommendationCar> customRecommendationCars;

    @Builder
    public CustomRecommendation(
            Long id,
            Long drivingExperienceId,
            Long familyMembersId,
            Long carPurposeId,
            Long personalValueId,
            List<CustomRecommendationCar> customRecommendationCars) {
        this.id = id;
        this.drivingExperienceId = drivingExperienceId;
        this.familyMembersId = familyMembersId;
        this.carPurposeId = carPurposeId;
        this.personalValueId = personalValueId;
        this.customRecommendationCars = customRecommendationCars;
    }
}
