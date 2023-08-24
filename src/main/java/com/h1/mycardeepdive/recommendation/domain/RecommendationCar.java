package com.h1.mycardeepdive.recommendation.domain;

import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.color.domain.ExteriorColor;
import com.h1.mycardeepdive.color.domain.InteriorColor;
import java.util.List;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class RecommendationCar {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "recommendation_car_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "car_spec_id")
    private CarSpec carSpec;

    @ManyToOne
    @JoinColumn(name = "interior_color_id")
    private InteriorColor interiorColor;

    @ManyToOne
    @JoinColumn(name = "exterior_color_id")
    private ExteriorColor exteriorColor;

    private long price;

    @OneToMany(mappedBy = "recommendationCar", fetch = FetchType.LAZY)
    private List<RecommendationCarOption> recommendationCarOptions;

    @OneToMany(mappedBy = "recommendationCar", fetch = FetchType.LAZY)
    private List<RecommendationCarPackage> recommendationCarPackages;

    @Builder
    public RecommendationCar(
            Long id,
            CarSpec carSpec,
            InteriorColor interiorColor,
            ExteriorColor exteriorColor,
            List<RecommendationCarOption> recommendationCarOptions,
            List<RecommendationCarPackage> recommendationCarPackages) {
        this.id = id;
        this.carSpec = carSpec;
        this.interiorColor = interiorColor;
        this.exteriorColor = exteriorColor;
        this.recommendationCarOptions = recommendationCarOptions;
        this.recommendationCarPackages = recommendationCarPackages;
    }
}
