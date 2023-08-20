package com.h1.mycardeepdive.recommendation.mapper;

import com.h1.mycardeepdive.options.domain.Options;
import com.h1.mycardeepdive.options.domain.Packages;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationOptionDto;

public class RecommendationOptionDtoMapper {
    public static RecommendationOptionDto toRecommendationOptionDto(Options option) {
        return new RecommendationOptionDto(
                option.getId(),
                option.getName(),
                option.getImgUrl(),
                option.getPrice(),
                option.getSummary()
        );
    }

    public static RecommendationOptionDto toRecommendationOptionDto(Packages packages) {
        return new RecommendationOptionDto(
                packages.getId(),
                packages.getName(),
                packages.getOptionPackages().get(0).getOption().getImgUrl(),
                packages.getPrice(),
                packages.getSummary()
        );
    }
}
