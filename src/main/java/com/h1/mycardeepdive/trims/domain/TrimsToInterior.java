package com.h1.mycardeepdive.trims.domain;

import com.h1.mycardeepdive.color.domain.InteriorColor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor
public class TrimsToInterior {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trims_to_interior_color_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "trims_id")
    private Trims trims;

    @ManyToOne
    @JoinColumn(name = "interior_color_id")
    private InteriorColor interiorColor;
}
