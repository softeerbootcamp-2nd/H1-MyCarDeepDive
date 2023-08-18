package com.h1.mycardeepdive.color.domain;

import java.util.List;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

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

    @ManyToOne
    @JoinColumn(name = "interior_color_id")
    private InteriorColor interiorColor;

    @OneToMany(mappedBy = "colorCombination", fetch = FetchType.LAZY)
    private List<TrimColorCombination> trimsColorCombinations;

    @Builder
    public ColorCombination(
            Long id,
            ExteriorColor exteriorColor,
            InteriorColor interiorColor,
            List<TrimColorCombination> trimsColorCombinations) {
        this.id = id;
        this.exteriorColor = exteriorColor;
        this.interiorColor = interiorColor;
        this.trimsColorCombinations = trimsColorCombinations;
    }
}
