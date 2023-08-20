package com.h1.mycardeepdive.recommendation.domain;

import com.h1.mycardeepdive.options.domain.Packages;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor
public class RecommendationCarPackage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "recommendation_car_package_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "package_id")
    private Packages packages;


    @ManyToOne
    @JoinColumn(name = "recommendation_car_id")
    private RecommendationCar recommendationCar;

    @Builder
    public RecommendationCarPackage(Long id, Packages packages, RecommendationCar recommendationCar) {
        this.id = id;
        this.packages = packages;
        this.recommendationCar = recommendationCar;
    }
}
