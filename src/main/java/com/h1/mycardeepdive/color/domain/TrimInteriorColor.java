package com.h1.mycardeepdive.color.domain;

import com.h1.mycardeepdive.trims.domain.Trim;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class TrimInteriorColor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trim_interior_color_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "trim_id")
    private Trim trim;

    @ManyToOne
    @JoinColumn(name = "interior_color_id")
    private InteriorColor interiorColor;

    @Builder
    public TrimInteriorColor(Long id, Trim trim, InteriorColor interiorColor) {
        this.id = id;
        this.trim = trim;
        this.interiorColor = interiorColor;
    }
}
