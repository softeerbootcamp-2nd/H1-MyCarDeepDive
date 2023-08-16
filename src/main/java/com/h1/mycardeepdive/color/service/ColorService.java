package com.h1.mycardeepdive.color.service;

import com.h1.mycardeepdive.color.domain.*;
import com.h1.mycardeepdive.color.domain.repository.TrimColorCombinationRepository;
import com.h1.mycardeepdive.color.domain.repository.TrimExteriorColorRepository;
import com.h1.mycardeepdive.color.domain.repository.TrimInteriorColorRepository;
import com.h1.mycardeepdive.color.ui.dto.ExteriorColorInfo;
import com.h1.mycardeepdive.color.ui.dto.ExteriorColorResponse;
import com.h1.mycardeepdive.color.ui.dto.InteriorColorInfo;
import com.h1.mycardeepdive.color.ui.dto.InteriorColorResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class ColorService {

    private final TrimColorCombinationRepository trimColorCombinationRepository;
    private final TrimExteriorColorRepository trimExteriorColorRepository;
    private final TrimInteriorColorRepository trimInteriorColorRepository;

    public ExteriorColorResponse findExteriorColors(Long trimId, Long interiorColorId) {
        List<TrimColorCombination> trimColorCombinations =
                trimColorCombinationRepository.findByTrim_Id(trimId);
        List<ExteriorColorInfo> availableColors = new ArrayList<>();
        List<ExteriorColorInfo> unavailableExteriorColors = new ArrayList<>();
        List<ExteriorColorInfo> otherTrimColors = new ArrayList<>();
        for (TrimColorCombination trimColorCombination : trimColorCombinations) {
            ColorCombination colorCombination = trimColorCombination.getColorCombination();
            ExteriorColor exteriorColor = colorCombination.getExteriorColor();
            ExteriorColorInfo colorInfo =
                    ExteriorColorInfo.builder()
                            .name(exteriorColor.getName())
                            .price(exteriorColor.getPrice())
                            .img_url(exteriorColor.getImgUrl())
                            .car_img_urls(
                                    IntStream.rangeClosed(1, 60)
                                            .mapToObj(
                                                    number ->
                                                            exteriorColor.getExteriorImgUrl()
                                                                    + String.format(
                                                                            "/%03d.jpg", number))
                                            .collect(Collectors.toList()))
                            .choose_rate(exteriorColor.getChooseRate())
                            .trim_name(trimColorCombination.getTrim().getName())
                            .build();
            if (colorCombination.getInteriorColor().getId().equals(interiorColorId)) {
                availableColors.add(colorInfo);
            } else {
                unavailableExteriorColors.add(colorInfo);
            }
        }
        List<TrimExteriorColor> trimExteriorColors =
                trimExteriorColorRepository.findByTrim_IdNot(trimId);
        for (TrimExteriorColor trimExteriorColor : trimExteriorColors) {
            ExteriorColor exteriorColor = trimExteriorColor.getExteriorColor();
            ExteriorColorInfo colorInfo =
                    ExteriorColorInfo.builder()
                            .name(exteriorColor.getName())
                            .price(exteriorColor.getPrice())
                            .img_url(exteriorColor.getImgUrl())
                            .car_img_urls(
                                    IntStream.rangeClosed(1, 60)
                                            .mapToObj(
                                                    number ->
                                                            exteriorColor.getExteriorImgUrl()
                                                                    + String.format(
                                                                            "/%03d.jpg", number))
                                            .collect(Collectors.toList()))
                            .choose_rate(exteriorColor.getChooseRate())
                            .trim_name(trimExteriorColor.getTrim().getName())
                            .build();
            otherTrimColors.add(colorInfo);
        }

        return ExteriorColorResponse.builder()
                .available_colors(availableColors)
                .unavailable_colors(unavailableExteriorColors)
                .other_trim_colors(otherTrimColors)
                .build();
    }

    public InteriorColorResponse findInteriorColors(Long trimId, Long exteriorColorId) {
        List<TrimColorCombination> trimColorCombinations =
                trimColorCombinationRepository.findByTrim_Id(trimId);
        List<InteriorColorInfo> availableColors = new ArrayList<>();
        List<InteriorColorInfo> unavailableInteriorColors = new ArrayList<>();
        List<InteriorColorInfo> otherTrimColors = new ArrayList<>();
        for (TrimColorCombination trimColorCombination : trimColorCombinations) {
            ColorCombination colorCombination = trimColorCombination.getColorCombination();
            InteriorColor interiorColor = colorCombination.getInteriorColor();
            InteriorColorInfo colorInfo =
                    InteriorColorInfo.builder()
                            .name(interiorColor.getName())
                            .price(interiorColor.getPrice())
                            .img_url(interiorColor.getImgUrl())
                            .car_img_url(interiorColor.getInteriorImgUrl())
                            .choose_rate(interiorColor.getChooseRate())
                            .trim_name(trimColorCombination.getTrim().getName())
                            .build();
            if (colorCombination.getInteriorColor().getId().equals(exteriorColorId)) {
                availableColors.add(colorInfo);
            } else {
                unavailableInteriorColors.add(colorInfo);
            }
        }

        List<TrimInteriorColor> trimInteriorColors =
                trimInteriorColorRepository.findByTrim_IdNot(trimId);
        for (TrimInteriorColor trimInteriorColor : trimInteriorColors) {
            InteriorColor interiorColor = trimInteriorColor.getInteriorColor();
            InteriorColorInfo colorInfo =
                    InteriorColorInfo.builder()
                            .name(interiorColor.getName())
                            .price(interiorColor.getPrice())
                            .img_url(interiorColor.getImgUrl())
                            .car_img_url(interiorColor.getInteriorImgUrl())
                            .choose_rate(interiorColor.getChooseRate())
                            .trim_name(trimInteriorColor.getTrim().getName())
                            .build();
            otherTrimColors.add(colorInfo);
        }

        return InteriorColorResponse.builder()
                .available_colors(availableColors)
                .unavailable_colors(unavailableInteriorColors)
                .other_trim_colors(otherTrimColors)
                .build();
    }
}
