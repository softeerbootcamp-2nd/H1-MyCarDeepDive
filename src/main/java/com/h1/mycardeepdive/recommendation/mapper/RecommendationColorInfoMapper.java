package com.h1.mycardeepdive.recommendation.mapper;

import com.h1.mycardeepdive.color.domain.ExteriorColor;
import com.h1.mycardeepdive.color.domain.InteriorColor;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationColorInfo;

public class RecommendationColorInfoMapper {
    public static RecommendationColorInfo toRecommendationColorInfo(InteriorColor interiorColor) {
        return new RecommendationColorInfo(
                interiorColor.getId(),
                interiorColor.getName(),
                interiorColor.getPrice(),
                interiorColor.getComment(),
                interiorColor.getImgUrl());
    }

    public static RecommendationColorInfo toRecommendationColorInfo(ExteriorColor exteriorColor) {
        return new RecommendationColorInfo(
                exteriorColor.getId(),
                exteriorColor.getName(),
                exteriorColor.getPrice(),
                exteriorColor.getComment(),
                exteriorColor.getImgUrl());
    }
}
