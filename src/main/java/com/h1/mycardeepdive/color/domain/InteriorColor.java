package com.h1.mycardeepdive.color.domain;

import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class InteriorColor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "interior_color_id")
    private Long id;

    private String name;

    private long price;

    private String img_url;

    private String comment;

    private String interior_img_url;
}
