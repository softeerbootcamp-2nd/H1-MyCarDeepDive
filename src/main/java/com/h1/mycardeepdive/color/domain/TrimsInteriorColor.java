package com.h1.mycardeepdive.color.domain;

import com.h1.mycardeepdive.trims.domain.Trims;
import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class TrimsInteriorColor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trims_interior_color_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "trims_id")
    private Trims trims;

    @ManyToOne
    @JoinColumn(name = "interior_color_id")
    private InteriorColor interiorColor;
}
