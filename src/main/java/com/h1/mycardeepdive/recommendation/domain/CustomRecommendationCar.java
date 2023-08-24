package com.h1.mycardeepdive.recommendation.domain;

import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class CustomRecommendationCar {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "custom_recommendation_car_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "custom_recommendation_id")
    private CustomRecommendation customRecommendation;

    @ManyToOne
    @JoinColumn(name = "recommendation_car_id")
    private RecommendationCar recommendationCar;

    @Builder
    public CustomRecommendationCar(
            Long id,
            CustomRecommendation customRecommendation,
            RecommendationCar recommendationCar) {
        this.id = id;
        this.customRecommendation = customRecommendation;
        this.recommendationCar = recommendationCar;
    }
}
