package com.h1.mycardeepdive.color.domain;

import java.util.List;
import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class ExteriorColor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "exterior_color_id")
    private Long id;

    private String name;

    private long price;

    private String img_url;

    private String comment;

    private String exterior_img_url;

    @OneToMany(mappedBy = "exteriorColor", fetch = FetchType.LAZY)
    private List<ColorCombination> colorCombinationList;
}
