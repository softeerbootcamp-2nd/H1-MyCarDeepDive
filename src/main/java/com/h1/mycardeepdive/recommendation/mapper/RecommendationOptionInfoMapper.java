package com.h1.mycardeepdive.recommendation.mapper;

import com.h1.mycardeepdive.options.domain.Options;
import com.h1.mycardeepdive.options.domain.Packages;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationOptionInfo;

public class RecommendationOptionInfoMapper {
    public static RecommendationOptionInfo toRecommendationOptionInfo(Options option) {
        return new RecommendationOptionInfo(
                option.getId(),
                option.getName(),
                option.getImgUrl(),
                option.getPrice(),
                option.getSummary());
    }

    public static RecommendationOptionInfo toRecommendationOptionInfo(Packages packages) {
        return new RecommendationOptionInfo(
                packages.getId(),
                packages.getName(),
                packages.getOptionPackages().get(0).getOption().getImgUrl(),
                packages.getPrice(),
                packages.getSummary());
    }
}
