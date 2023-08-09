package com.h1.mycardeepdive.color.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor
public class ColorCombination {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "color_combination_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "exterior_color_id")
    private ExteriorColor exteriorColor;

    public void setExteriorColor(ExteriorColor exteriorColor) {
        this.exteriorColor = exteriorColor;
        exteriorColor.getColorCombinationList().add(this);
    }
}