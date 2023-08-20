package com.h1.mycardeepdive.recommendation.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor
public class Recommendation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "recommendation_id")
    private Long id;

    private Long ageGroupId;

    private Long lifeStyleId;

    private String description;

    @ManyToOne
    @JoinColumn(name = "recommendation_car_id")
    private RecommendationCar recommendationCar;

    @Builder
    public Recommendation(Long id, Long ageGroupId, Long lifeStyleId, String description, RecommendationCar recommendationCar) {
        this.id = id;
        this.ageGroupId = ageGroupId;
        this.lifeStyleId = lifeStyleId;
        this.description = description;
        this.recommendationCar = recommendationCar;
    }
}