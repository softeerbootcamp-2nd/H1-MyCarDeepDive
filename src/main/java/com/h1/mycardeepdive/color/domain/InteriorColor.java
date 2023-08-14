package com.h1.mycardeepdive.color.domain;

import java.util.List;
import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class InteriorColor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "interior_color_id")
    private Long id;

    private String name;

    private long price;

    private String imgUrl;

    private String comment;

    private String interiorImgUrl;

    private double chooseRate;

    @OneToMany(mappedBy = "interiorColor", fetch = FetchType.LAZY)
    private List<ColorCombination> colorCombinationList;
}
