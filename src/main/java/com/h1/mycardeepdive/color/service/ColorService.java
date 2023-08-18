package com.h1.mycardeepdive.color.service;

import static com.h1.mycardeepdive.color.mapper.ColorMapper.toExteriorColorInfo;
import static com.h1.mycardeepdive.color.mapper.ColorMapper.toInteriorColorInfo;

import com.h1.mycardeepdive.color.domain.*;
import com.h1.mycardeepdive.color.domain.repository.TrimColorCombinationRepository;
import com.h1.mycardeepdive.color.domain.repository.TrimExteriorColorRepository;
import com.h1.mycardeepdive.color.domain.repository.TrimInteriorColorRepository;
import com.h1.mycardeepdive.color.ui.dto.*;
import java.util.*;
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
        Map<Long, ExteriorColorInfo> availableColors = new HashMap<>();
        Map<Long, ExteriorColorInfo> unavailableColors = new HashMap<>();
        Map<Long, ExteriorColorInfo> otherTrimColors = new HashMap<>();
        for (TrimColorCombination trimColorCombination : trimColorCombinations) {
            ColorCombination colorCombination = trimColorCombination.getColorCombination();
            ExteriorColor exteriorColor = colorCombination.getExteriorColor();
            ExteriorColorInfo colorInfo = toExteriorColorInfo(exteriorColor);
            if (colorCombination.getInteriorColor().getId().equals(interiorColorId)) {
                availableColors.put(exteriorColor.getId(), colorInfo);
            } else {
                unavailableColors.put(exteriorColor.getId(), colorInfo);
            }
        }
        List<TrimExteriorColor> trimExteriorColors =
                trimExteriorColorRepository.findByTrim_IdNot(trimId);
        for (TrimExteriorColor trimExteriorColor : trimExteriorColors) {
            ExteriorColor exteriorColor = trimExteriorColor.getExteriorColor();
            ExteriorColorInfo colorInfo = toExteriorColorInfo(exteriorColor);
            otherTrimColors.put(exteriorColor.getId(), colorInfo);
        }

        return new ExteriorColorResponse(availableColors, unavailableColors, otherTrimColors);
    }

    public InteriorColorResponse findInteriorColors(Long trimId, Long exteriorColorId) {
        List<TrimColorCombination> trimColorCombinations =
                trimColorCombinationRepository.findByTrim_Id(trimId);
        Map<Long, InteriorColorInfo> availableColors = new HashMap<>();
        Map<Long, InteriorColorInfo> unavailableColors = new HashMap<>();
        Map<Long, InteriorColorInfo> otherTrimColors = new HashMap<>();
        for (TrimColorCombination trimColorCombination : trimColorCombinations) {
            ColorCombination colorCombination = trimColorCombination.getColorCombination();
            InteriorColor interiorColor = colorCombination.getInteriorColor();
            InteriorColorInfo colorInfo = toInteriorColorInfo(interiorColor);
            if (colorCombination.getInteriorColor().getId().equals(exteriorColorId)) {
                availableColors.put(interiorColor.getId(), colorInfo);
            } else {
                unavailableColors.put(interiorColor.getId(), colorInfo);
            }
        }

        List<TrimInteriorColor> trimInteriorColors =
                trimInteriorColorRepository.findByTrim_IdNot(trimId);
        for (TrimInteriorColor trimInteriorColor : trimInteriorColors) {
            InteriorColor interiorColor = trimInteriorColor.getInteriorColor();
            InteriorColorInfo colorInfo = toInteriorColorInfo(interiorColor);
            otherTrimColors.put(interiorColor.getId(), colorInfo);
        }

        return new InteriorColorResponse(availableColors, unavailableColors, otherTrimColors);
    }

    public AllColorResponse findAllColors(Long trimId) {
        List<TrimExteriorColor> trimExteriorColors =
                trimExteriorColorRepository.findByTrim_Id(trimId);
        Set<ExteriorColor> exteriorColorSet = new HashSet<>();
        for (TrimExteriorColor trimExteriorColor : trimExteriorColors) {
            exteriorColorSet.add(trimExteriorColor.getExteriorColor());
        }
        ExteriorColor exteriorColor =
                exteriorColorSet.stream()
                        .max((o1, o2) -> (int) (o2.getChooseRate() - o1.getChooseRate()))
                        .orElseThrow();
        InteriorColorResponse interiorColorResponse =
                findInteriorColors(trimId, exteriorColor.getId());
        Map.Entry<Long, InteriorColorInfo> entry =
                interiorColorResponse.getAvailable_colors().entrySet().stream()
                        .max(
                                (o1, o2) ->
                                        (int)
                                                (o2.getValue().getChoose_rate()
                                                        - o1.getValue().getChoose_rate()))
                        .orElseThrow();
        Long interiorId = entry.getKey();
        ExteriorColorResponse exteriorColorResponse = findExteriorColors(trimId, interiorId);
        return new AllColorResponse(exteriorColorResponse, interiorColorResponse);
    }
}
