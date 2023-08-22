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
        List<ExteriorColorInfo> availableColorInfos = new ArrayList<>();
        List<ExteriorColorInfo> unavailableColorInfos = new ArrayList<>();
        List<ExteriorColorInfo> otherTrimColorInfos = new ArrayList<>();
        List<ExteriorColor> allExteriorColors = trimExteriorColorRepository.findAllExteriorColors();
        //
        List<TrimExteriorColor> trimExteriorColors =
                trimExteriorColorRepository.findByTrimId(trimId);
        for (TrimExteriorColor trimExteriorColor : trimExteriorColors) {
            ExteriorColor exteriorColor = trimExteriorColor.getExteriorColor();
            Trim trim = trimExteriorColor.getTrim();
            if (isExteriorColorAvailableForInteriorColor(exteriorColor, interiorColorId)) {
                availableColors.add(exteriorColor);
                availableColorInfos.add(toExteriorColorInfo(exteriorColor, trim));

            } else {
                unavailableColors.add(exteriorColor);
                unavailableColorInfos.add(toExteriorColorInfo(exteriorColor, trim));
            }
        }
        allExteriorColors.removeAll(availableColors);
        allExteriorColors.removeAll(unavailableColors);
        for (ExteriorColor exteriorColor : allExteriorColors) {
            Trim trim = exteriorColor.getTrimExteriorColors().get(0).getTrim();
            otherTrimColorInfos.add(toExteriorColorInfo(exteriorColor, trim));
        }
        availableColorInfos.sort((o1, o2) -> (int) (o2.getChoose_rate() - o1.getChoose_rate()));
        unavailableColorInfos.sort((o1, o2) -> (int) (o2.getChoose_rate() - o1.getChoose_rate()));
        otherTrimColorInfos.sort((o1, o2) -> (int) (o2.getChoose_rate() - o1.getChoose_rate()));
        return new ExteriorColorResponse(
                availableColorInfos, unavailableColorInfos, otherTrimColorInfos);
    }

    public InteriorColorResponse findInteriorColors(Long trimId, Long exteriorColorId) {
        List<InteriorColor> availableColors = new ArrayList<>();
        List<InteriorColor> unavailableColors = new ArrayList<>();
        List<InteriorColorInfo> availableColorInfos = new ArrayList<>();
        List<InteriorColorInfo> unavailableColorInfos = new ArrayList<>();
        List<InteriorColorInfo> otherTrimColorInfos = new ArrayList<>();
        List<InteriorColor> allInteriorColors = trimInteriorColorRepository.findAllInteriorColors();
        //
        List<TrimInteriorColor> trimInteriorColors =
                trimInteriorColorRepository.findByTrimId(trimId);
        for (TrimInteriorColor trimInteriorColor : trimInteriorColors) {
            InteriorColor interiorColor = trimInteriorColor.getInteriorColor();
            Trim trim = trimInteriorColor.getTrim();
            if (isInteriorColorAvailableForExteriorColor(interiorColor, exteriorColorId)) {
                availableColors.add(interiorColor);
                availableColorInfos.add(toInteriorColorInfo(interiorColor, trim));
            } else {
                unavailableColors.add(interiorColor);
                unavailableColorInfos.add(toInteriorColorInfo(interiorColor, trim));
            }
        }
        allInteriorColors.removeAll(availableColors);
        allInteriorColors.removeAll(unavailableColors);
        for (InteriorColor interiorColor : allInteriorColors) {
            Trim trim = interiorColor.getTrimInteriorColors().get(0).getTrim();
            otherTrimColorInfos.add(toInteriorColorInfo(interiorColor, trim));
        }
        availableColorInfos.sort((o1, o2) -> (int) (o2.getChoose_rate() - o1.getChoose_rate()));
        unavailableColorInfos.sort((o1, o2) -> (int) (o2.getChoose_rate() - o1.getChoose_rate()));
        otherTrimColorInfos.sort((o1, o2) -> (int) (o2.getChoose_rate() - o1.getChoose_rate()));
        return new InteriorColorResponse(
                availableColorInfos, unavailableColorInfos, otherTrimColorInfos);
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
        InteriorColorInfo interiorColorInfo =
                interiorColorResponse.getAvailable_colors().stream()
                        .max((o1, o2) -> (int) (o2.getChoose_rate() - o1.getChoose_rate()))
                        .orElseThrow();
        Long interiorId = interiorColorInfo.getColor_id();
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

    public boolean userClickedExteriorColorLog(Long exteriorColorId) {
        return true;
    }

    public boolean userClickedInteriorColorLog(Long interiorColorId) {
        return true;
    }
}
