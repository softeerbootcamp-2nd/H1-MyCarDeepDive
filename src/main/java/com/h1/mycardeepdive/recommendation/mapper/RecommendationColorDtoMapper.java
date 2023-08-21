package com.h1.mycardeepdive.recommendation.mapper;

import com.h1.mycardeepdive.color.domain.ExteriorColor;
import com.h1.mycardeepdive.color.domain.InteriorColor;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationColorDto;

public class RecommendationColorDtoMapper {
    public static RecommendationColorDto toRecommendationColorDto(InteriorColor interiorColor) {
        return new RecommendationColorDto(
                interiorColor.getId(),
                interiorColor.getName(),
                interiorColor.getPrice(),
                interiorColor.getComment(),
                interiorColor.getImgUrl());
    }

    public static RecommendationColorDto toRecommendationColorDto(ExteriorColor exteriorColor) {
        return new RecommendationColorDto(
                exteriorColor.getId(),
                exteriorColor.getName(),
                exteriorColor.getPrice(),
                exteriorColor.getComment(),
                exteriorColor.getImgUrl());
    }
}
