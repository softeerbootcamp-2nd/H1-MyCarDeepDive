package com.h1.mycardeepdive.recommendation.domain;

import com.h1.mycardeepdive.options.domain.Options;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class RecommendationCarOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "recommendation_car_option_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "option_id")
    private Options option;

    @ManyToOne
    @JoinColumn(name = "recommendation_car_id")
    private RecommendationCar recommendationCar;

    @Builder
    public RecommendationCarOption(Long id, Options option, RecommendationCar recommendationCar) {
        this.id = id;
        this.option = option;
        this.recommendationCar = recommendationCar;
    }
}
