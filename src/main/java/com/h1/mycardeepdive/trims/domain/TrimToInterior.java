package com.h1.mycardeepdive.trims.domain;

import com.h1.mycardeepdive.color.domain.InteriorColor;
import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class TrimToInterior {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trim_to_interior_color_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "trim_id")
    private Trim trim;

    @ManyToOne
    @JoinColumn(name = "interior_color_id")
    private InteriorColor interiorColor;
}
