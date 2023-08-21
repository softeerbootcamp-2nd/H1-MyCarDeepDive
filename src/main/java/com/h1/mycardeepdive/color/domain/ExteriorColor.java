package com.h1.mycardeepdive.color.domain;

import java.util.List;
import javax.persistence.*;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
public class ExteriorColor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "exterior_color_id")
    private Long id;

    private String name;

    private long price;

    private String imgUrl;

    private String comment;

    private String exteriorImgUrl;

    private double chooseRate;

    @OneToMany(mappedBy = "exteriorColor", fetch = FetchType.LAZY)
    private List<ColorCombination> colorCombinations;

    @OneToMany(mappedBy = "exteriorColor", fetch = FetchType.LAZY)
    private List<TrimExteriorColor> trimExteriorColors;

    @Builder
    public ExteriorColor(
            Long id,
            String name,
            long price,
            String imgUrl,
            String comment,
            String exteriorImgUrl,
            double chooseRate,
            List<ColorCombination> colorCombinations,
            List<TrimExteriorColor> trimExteriorColors) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgUrl = imgUrl;
        this.comment = comment;
        this.exteriorImgUrl = exteriorImgUrl;
        this.chooseRate = chooseRate;
        this.colorCombinations = colorCombinations;
        this.trimExteriorColors = trimExteriorColors;
    }
}
