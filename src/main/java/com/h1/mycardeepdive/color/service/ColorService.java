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
import net.logstash.logback.marker.Markers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class ColorService {

    private final TrimExteriorColorRepository trimExteriorColorRepository;
    private final TrimInteriorColorRepository trimInteriorColorRepository;

    public ColorResponse findExteriorColors(Long trimId, Long interiorColorId) {
        List<ExteriorColor> availableColors = new ArrayList<>();
        List<ExteriorColor> unavailableColors = new ArrayList<>();
        List<ColorInfo> availableColorInfos = new ArrayList<>();
        List<ColorInfo> unavailableColorInfos = new ArrayList<>();
        List<ColorInfo> otherTrimColorInfos = new ArrayList<>();
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
        return new ColorResponse(availableColorInfos, unavailableColorInfos, otherTrimColorInfos);
    }

    public ColorResponse findInteriorColors(Long trimId, Long exteriorColorId) {
        List<InteriorColor> availableColors = new ArrayList<>();
        List<InteriorColor> unavailableColors = new ArrayList<>();
        List<ColorInfo> availableColorInfos = new ArrayList<>();
        List<ColorInfo> unavailableColorInfos = new ArrayList<>();
        List<ColorInfo> otherTrimColorInfos = new ArrayList<>();
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
        return new ColorResponse(availableColorInfos, unavailableColorInfos, otherTrimColorInfos);
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
        ColorResponse interiorColorResponse = findInteriorColors(trimId, exteriorColor.getId());
        ColorInfo interiorColorInfo =
                interiorColorResponse.getAvailable_colors().stream()
                        .max((o1, o2) -> (int) (o2.getChoose_rate() - o1.getChoose_rate()))
                        .orElseThrow();
        Long interiorId = interiorColorInfo.getColor_id();
        ColorResponse colorResponse = findExteriorColors(trimId, interiorId);
        return new AllColorResponse(colorResponse, interiorColorResponse);
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
        log.info(Markers.append("exterior_color", exteriorColorId), "exterior_color");
        return true;
    }

    public boolean userClickedInteriorColorLog(Long interiorColorId) {
        log.info(Markers.append("interior_color", interiorColorId), "interior_color");
        return true;
    }
}
