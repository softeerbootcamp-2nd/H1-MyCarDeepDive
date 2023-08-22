package com.h1.mycardeepdive.trims.domain;

import com.h1.mycardeepdive.car.domain.Car;
import com.h1.mycardeepdive.color.domain.TrimColorCombination;
import com.h1.mycardeepdive.color.domain.TrimExteriorColor;
import com.h1.mycardeepdive.color.domain.TrimInteriorColor;
import java.util.List;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@Table(name = "trims")
public class Trim {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trim_id")
    private Long id;

    private String name;

    private String description;

    private String imgUrl;

    private String wheelName;

    private double wheelSize;

    private String seatName;

    private double navigationSize;

    private double clusterSize;

    private String summary;

    @ManyToOne
    @JoinColumn(name = "car_id")
    private Car car;

    @OneToMany(mappedBy = "trim", fetch = FetchType.LAZY)
    private List<TrimColorCombination> trimColorCombinations;

    @OneToMany(mappedBy = "trim", fetch = FetchType.LAZY)
    private List<TrimInteriorColor> trimInteriorColors;

    @OneToMany(mappedBy = "trim", fetch = FetchType.LAZY)
    private List<TrimExteriorColor> trimExteriorColors;

    @Builder
    public Trim(
            Long id,
            String name,
            String description,
            String imgUrl,
            String wheelName,
            double wheelSize,
            String seatName,
            double navigationSize,
            double clusterSize,
            String summary,
            Car car,
            List<TrimColorCombination> trimColorCombinations,
            List<TrimInteriorColor> trimInteriorColors,
            List<TrimExteriorColor> trimExteriorColors) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.imgUrl = imgUrl;
        this.wheelName = wheelName;
        this.wheelSize = wheelSize;
        this.seatName = seatName;
        this.navigationSize = navigationSize;
        this.clusterSize = clusterSize;
        this.summary = summary;
        this.car = car;
        this.trimColorCombinations = trimColorCombinations;
        this.trimInteriorColors = trimInteriorColors;
        this.trimExteriorColors = trimExteriorColors;
    }
}
