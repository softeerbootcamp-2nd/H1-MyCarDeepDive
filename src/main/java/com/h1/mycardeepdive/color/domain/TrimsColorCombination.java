package com.h1.mycardeepdive.color.domain;

import com.h1.mycardeepdive.trims.domain.Trims;
import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class TrimsColorCombination {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trims_color_combination_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "trims_id")
    private Trims trims;

    @ManyToOne
    @JoinColumn(name = "color_combination_id")
    private ColorCombination colorCombination;
}
