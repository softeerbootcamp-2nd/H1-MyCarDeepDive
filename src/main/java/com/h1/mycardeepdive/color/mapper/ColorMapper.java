package com.h1.mycardeepdive.color.mapper;

import com.h1.mycardeepdive.color.domain.ExteriorColor;
import com.h1.mycardeepdive.color.domain.InteriorColor;
import com.h1.mycardeepdive.color.ui.dto.ExteriorColorInfo;
import com.h1.mycardeepdive.color.ui.dto.InteriorColorInfo;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class ColorMapper {
    public static InteriorColorInfo toInteriorColorInfo(InteriorColor interiorColor) {
        return new InteriorColorInfo(
                interiorColor.getName(),
                interiorColor.getImgUrl(),
                interiorColor.getInteriorImgUrl(),
                interiorColor.getPrice(),
                interiorColor.getChooseRate());
    }

    public static ExteriorColorInfo toExteriorColorInfo(ExteriorColor exteriorColor) {
        return new ExteriorColorInfo(
                exteriorColor.getName(),
                exteriorColor.getImgUrl(),
                IntStream.rangeClosed(1, 60)
                        .mapToObj(
                                number ->
                                        exteriorColor.getExteriorImgUrl()
                                                + String.format("/image_%03d.png", number))
                        .collect(Collectors.toList()),
                exteriorColor.getPrice(),
                exteriorColor.getChooseRate());
    }
}
