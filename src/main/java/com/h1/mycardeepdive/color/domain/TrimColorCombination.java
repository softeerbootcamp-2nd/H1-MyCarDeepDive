package com.h1.mycardeepdive.color.domain;

import com.h1.mycardeepdive.trims.domain.Trim;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class TrimColorCombination {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trim_color_combination_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "trim_id")
    private Trim trim;

    @ManyToOne
    @JoinColumn(name = "color_combination_id")
    private ColorCombination colorCombination;

    @Builder
    public TrimColorCombination(Long id, Trim trim, ColorCombination colorCombination) {
        this.id = id;
        this.trim = trim;
        this.colorCombination = colorCombination;
    }
}
