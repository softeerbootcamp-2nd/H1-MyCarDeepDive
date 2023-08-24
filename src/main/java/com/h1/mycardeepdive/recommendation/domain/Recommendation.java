package com.h1.mycardeepdive.recommendation.domain;

import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

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

    private String comment1;

    private String comment2;

    private String keyword;

    @ManyToOne
    @JoinColumn(name = "recommendation_car_id")
    private RecommendationCar recommendationCar;

    @Builder
    public Recommendation(
            Long id,
            Long ageGroupId,
            Long lifeStyleId,
            String description,
            String comment1,
            String comment2,
            String keyword,
            RecommendationCar recommendationCar) {
        this.id = id;
        this.ageGroupId = ageGroupId;
        this.lifeStyleId = lifeStyleId;
        this.description = description;
        this.comment1 = comment1;
        this.comment2 = comment2;
        this.keyword = keyword;
        this.recommendationCar = recommendationCar;
    }
}
