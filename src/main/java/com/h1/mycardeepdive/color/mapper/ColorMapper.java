package com.h1.mycardeepdive.color.mapper;

import com.h1.mycardeepdive.color.domain.ColorCombination;
import com.h1.mycardeepdive.color.domain.ExteriorColor;
import com.h1.mycardeepdive.color.domain.InteriorColor;
import com.h1.mycardeepdive.color.ui.dto.ColorInfo;
import com.h1.mycardeepdive.trims.domain.Trim;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class ColorMapper {
    private static final int INITIAL_IMAGE_NUMBER = 1;
    private static final int LAST_IMAGE_NUMBER = 60;
    private static final String IMAGE_DESTINATION = "/image_%03d.png";

    public static ColorInfo toInteriorColorInfo(InteriorColor interiorColor, Trim trim) {
        List<Long> exteriorIds =
                interiorColor.getColorCombinations().stream()
                        .map(ColorCombination::getExteriorColor)
                        .map(ExteriorColor::getId)
                        .collect(Collectors.toList());
        return new ColorInfo(
                interiorColor.getId(),
                trim.getId(),
                trim.getName(),
                interiorColor.getName(),
                interiorColor.getImgUrl(),
                List.of(interiorColor.getInteriorImgUrl()),
                interiorColor.getPrice(),
                interiorColor.getChooseRate(),
                exteriorIds);
    }

    public static ColorInfo toExteriorColorInfo(ExteriorColor exteriorColor, Trim trim) {
        List<Long> interiorIds =
                exteriorColor.getColorCombinations().stream()
                        .map(ColorCombination::getInteriorColor)
                        .map(InteriorColor::getId)
                        .collect(Collectors.toList());
        return new ColorInfo(
                exteriorColor.getId(),
                trim.getId(),
                trim.getName(),
                exteriorColor.getName(),
                exteriorColor.getImgUrl(),
                IntStream.rangeClosed(INITIAL_IMAGE_NUMBER, LAST_IMAGE_NUMBER)
                        .mapToObj(
                                number ->
                                        exteriorColor.getExteriorImgUrl()
                                                + String.format(IMAGE_DESTINATION, number))
                        .collect(Collectors.toList()),
                exteriorColor.getPrice(),
                exteriorColor.getChooseRate(),
                interiorIds);
    }
}
