package com.h1.mycardeepdive.color.domain;


import com.h1.mycardeepdive.trims.domain.Trims;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor
public class TrimsExteriorColor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trims_exterior_color_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "trims_id")
    private Trims trims;

    @ManyToOne
    @JoinColumn(name = "exterior_color_id")
    private ExteriorColor exteriorColor;
}