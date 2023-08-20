package com.h1.mycardeepdive.color.service;

import static com.h1.mycardeepdive.color.mapper.ColorMapper.toExteriorColorInfo;
import static com.h1.mycardeepdive.color.mapper.ColorMapper.toInteriorColorInfo;

import com.h1.mycardeepdive.color.domain.*;
import com.h1.mycardeepdive.color.domain.repository.*;
import com.h1.mycardeepdive.color.ui.dto.*;
import com.h1.mycardeepdive.trims.domain.Trim;
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

    private final TrimExteriorColorRepository trimExteriorColorRepository;
    private final TrimInteriorColorRepository trimInteriorColorRepository;

    public ExteriorColorResponse findExteriorColors(Long trimId, Long interiorColorId) {
        List<ExteriorColor> availableColors = new ArrayList<>();
        List<ExteriorColor> unavailableColors = new ArrayList<>();
        Map<Long, ExteriorColorInfo> availableColorInfoMap = new HashMap<>();
        Map<Long, ExteriorColorInfo> unavailableColorInfoMap = new HashMap<>();
        Map<Long, ExteriorColorInfo> otherTrimColorInfoMap = new HashMap<>();
        List<ExteriorColor> allExteriorColors = trimExteriorColorRepository.findAllExteriorColors();
        //
        List<TrimExteriorColor> trimExteriorColors =
                trimExteriorColorRepository.findByTrimId(trimId);
        for (TrimExteriorColor trimExteriorColor : trimExteriorColors) {
            ExteriorColor exteriorColor = trimExteriorColor.getExteriorColor();
            Trim trim = trimExteriorColor.getTrim();
            if (isExteriorColorAvailableForInteriorColor(exteriorColor, interiorColorId)) {
                availableColors.add(exteriorColor);
                availableColorInfoMap.put(
                        exteriorColor.getId(), toExteriorColorInfo(exteriorColor, trim));

            } else {
                unavailableColors.add(exteriorColor);
                unavailableColorInfoMap.put(
                        exteriorColor.getId(), toExteriorColorInfo(exteriorColor, trim));
            }
        }
        allExteriorColors.removeAll(availableColors);
        allExteriorColors.removeAll(unavailableColors);
        for (ExteriorColor exteriorColor : allExteriorColors) {
            Trim trim = exteriorColor.getTrimExteriorColors().get(0).getTrim();
            otherTrimColorInfoMap.put(
                    exteriorColor.getId(), toExteriorColorInfo(exteriorColor, trim));
        }
        return new ExteriorColorResponse(
                availableColorInfoMap, unavailableColorInfoMap, otherTrimColorInfoMap);
    }

    public InteriorColorResponse findInteriorColors(Long trimId, Long exteriorColorId) {
        List<InteriorColor> availableColors = new ArrayList<>();
        List<InteriorColor> unavailableColors = new ArrayList<>();
        Map<Long, InteriorColorInfo> availableColorInfoMap = new HashMap<>();
        Map<Long, InteriorColorInfo> unavailableColorInfoMap = new HashMap<>();
        Map<Long, InteriorColorInfo> otherTrimColorInfoMap = new HashMap<>();
        List<InteriorColor> allInteriorColors = trimInteriorColorRepository.findAllInteriorColors();
        //
        List<TrimInteriorColor> trimInteriorColors =
                trimInteriorColorRepository.findByTrimId(trimId);
        for (TrimInteriorColor trimInteriorColor : trimInteriorColors) {
            InteriorColor interiorColor = trimInteriorColor.getInteriorColor();
            Trim trim = trimInteriorColor.getTrim();
            if (isInteriorColorAvailableForExteriorColor(interiorColor, exteriorColorId)) {
                availableColors.add(interiorColor);
                availableColorInfoMap.put(
                        interiorColor.getId(), toInteriorColorInfo(interiorColor, trim));
            } else {
                unavailableColors.add(interiorColor);
                unavailableColorInfoMap.put(
                        interiorColor.getId(), toInteriorColorInfo(interiorColor, trim));
            }
        }
        allInteriorColors.removeAll(availableColors);
        allInteriorColors.removeAll(unavailableColors);
        for (InteriorColor interiorColor : allInteriorColors) {
            Trim trim = interiorColor.getTrimInteriorColors().get(0).getTrim();
            otherTrimColorInfoMap.put(
                    interiorColor.getId(), toInteriorColorInfo(interiorColor, trim));
        }
        return new InteriorColorResponse(
                availableColorInfoMap, unavailableColorInfoMap, otherTrimColorInfoMap);
    }

    public AllColorResponse findAllColors(Long trimId) {
        List<TrimExteriorColor> trimExteriorColors =
                trimExteriorColorRepository.findByTrimId(trimId);
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

    private boolean isExteriorColorAvailableForInteriorColor(
            ExteriorColor exteriorColor, Long interiorColorId) {
        List<ColorCombination> colorCombinations = exteriorColor.getColorCombinations();
        for (ColorCombination colorCombination : colorCombinations) {
            if (colorCombination.getInteriorColor().getId().equals(interiorColorId)) {
                return true;
            }
        }
        return false;
    }

    private boolean isInteriorColorAvailableForExteriorColor(
            InteriorColor interiorColor, Long exteriorColorId) {
        List<ColorCombination> colorCombinations = interiorColor.getColorCombinations();
        for (ColorCombination colorCombination : colorCombinations) {
            if (colorCombination.getExteriorColor().getId().equals(exteriorColorId)) {
                return true;
            }
        }
        return false;
    }
}
