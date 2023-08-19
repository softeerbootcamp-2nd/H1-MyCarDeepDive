package com.h1.mycardeepdive.color.domain;

import com.h1.mycardeepdive.trims.domain.Trim;
import java.util.List;
import javax.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
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

    @Builder
    public TrimExteriorColor(Long id, Trim trim, ExteriorColor exteriorColor) {
        this.id = id;
        this.trim = trim;
        this.exteriorColor = exteriorColor;
    }

    public boolean isExteriorColorAvailableForInteriorColor(Long interiorColorId) {
        List<ColorCombination> colorCombinations = exteriorColor.getColorCombinations();
        for (ColorCombination colorCombination : colorCombinations) {
            if (colorCombination.getInteriorColor().getId().equals(interiorColorId)) {
                return true;
            }
        }
        return false;
    }
}
