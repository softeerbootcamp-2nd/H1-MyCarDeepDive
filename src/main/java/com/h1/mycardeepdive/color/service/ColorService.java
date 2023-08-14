package com.h1.mycardeepdive.color.service;

import com.h1.mycardeepdive.color.domain.ColorCombination;
import com.h1.mycardeepdive.color.domain.ExteriorColor;
import com.h1.mycardeepdive.color.domain.InteriorColor;
import com.h1.mycardeepdive.color.domain.TrimsColorCombination;
import com.h1.mycardeepdive.color.domain.repository.TrimsColorCombinationRepository;
import com.h1.mycardeepdive.color.ui.dto.ColorInfo;
import com.h1.mycardeepdive.color.ui.dto.ColorResponse;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class ColorService {

    private final TrimsColorCombinationRepository trimsColorCombinationRepository;

    public ColorResponse findExteriorColors(Long trimId, Long interiorColorId) {
        List<TrimsColorCombination> trimsColorCombinations =
                trimsColorCombinationRepository.findByTrims_Id(trimId);
        List<ColorInfo> exteriorColors = new ArrayList<>();
        List<ColorInfo> unavailableExteriorColors = new ArrayList<>();
        for (TrimsColorCombination trimsColorCombination : trimsColorCombinations) {
            ColorCombination colorCombination = trimsColorCombination.getColorCombination();
            ExteriorColor exteriorColor = colorCombination.getExteriorColor();
            ColorInfo colorInfo =
                    ColorInfo.builder()
                            .name(exteriorColor.getName())
                            .img_url(exteriorColor.getImgUrl())
                            .car_img_url(exteriorColor.getExteriorImgUrl())
                            .choose_rate(exteriorColor.getChooseRate())
                            .build();
            if (colorCombination.getInteriorColor().getId().equals(interiorColorId)) {
                exteriorColors.add(colorInfo);
            } else {
                unavailableExteriorColors.add(colorInfo);
            }
        }
        return ColorResponse.builder()
                .available_colors(exteriorColors)
                .unavailable_colors(unavailableExteriorColors)
                .build();
    }

    public ColorResponse findInteriorColors(Long trimId, Long exteriorColorId) {
        List<TrimsColorCombination> trimsColorCombinations =
                trimsColorCombinationRepository.findByTrims_Id(trimId);
        List<ColorInfo> interiorColors = new ArrayList<>();
        List<ColorInfo> unavailableInteriorColors = new ArrayList<>();
        for (TrimsColorCombination trimsColorCombination : trimsColorCombinations) {
            ColorCombination colorCombination = trimsColorCombination.getColorCombination();
            InteriorColor interiorColor = colorCombination.getInteriorColor();
            ColorInfo colorInfo =
                    ColorInfo.builder()
                            .name(interiorColor.getName())
                            .img_url(interiorColor.getImgUrl())
                            .car_img_url(interiorColor.getInteriorImgUrl())
                            .choose_rate(interiorColor.getChooseRate())
                            .build();
            if (colorCombination.getInteriorColor().getId().equals(exteriorColorId)) {
                interiorColors.add(colorInfo);
            } else {
                unavailableInteriorColors.add(colorInfo);
            }
        }
        return ColorResponse.builder()
                .available_colors(interiorColors)
                .unavailable_colors(unavailableInteriorColors)
                .build();
    }
}
