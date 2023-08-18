package com.h1.mycardeepdive.color.domain;

import com.h1.mycardeepdive.trims.domain.Trim;
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
public class TrimExteriorColor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trim_exterior_color_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "trim_id")
    private Trim trim;

    @ManyToOne
    @JoinColumn(name = "exterior_color_id")
    private ExteriorColor exteriorColor;
}
