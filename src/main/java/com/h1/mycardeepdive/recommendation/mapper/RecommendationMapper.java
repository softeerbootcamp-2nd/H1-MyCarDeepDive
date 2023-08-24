package com.h1.mycardeepdive.recommendation.mapper;

import static com.h1.mycardeepdive.recommendation.mapper.RecommendationColorInfoMapper.toRecommendationColorInfo;
import static com.h1.mycardeepdive.recommendation.mapper.RecommendationOptionInfoMapper.toRecommendationOptionInfo;

import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.color.domain.ExteriorColor;
import com.h1.mycardeepdive.color.domain.InteriorColor;
import com.h1.mycardeepdive.recommendation.domain.Recommendation;
import com.h1.mycardeepdive.recommendation.domain.RecommendationCar;
import com.h1.mycardeepdive.recommendation.domain.RecommendationCarOption;
import com.h1.mycardeepdive.recommendation.domain.RecommendationCarPackage;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationOptionInfo;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationResponse;
import com.h1.mycardeepdive.trims.domain.Trim;
import java.util.List;
import java.util.stream.Collectors;

public class RecommendationMapper {
    public static RecommendationResponse toRecommendationResponse(
            RecommendationCar recommendationCar) {
        CarSpec carSpec = recommendationCar.getCarSpec();
        Trim trim = carSpec.getTrim();
        ExteriorColor exteriorColor = recommendationCar.getExteriorColor();
        InteriorColor interiorColor = recommendationCar.getInteriorColor();
        List<RecommendationCarOption> recommendationCarOptions =
                recommendationCar.getRecommendationCarOptions();
        List<RecommendationCarPackage> recommendationCarPackages =
                recommendationCar.getRecommendationCarPackages();
        List<RecommendationOptionInfo> recommendationOptionInfos =
                recommendationCarOptions.stream()
                        .map(
                                recommendationCarOption ->
                                        RecommendationOptionInfoMapper.toRecommendationOptionInfo(
                                                recommendationCarOption.getOption()))
                        .collect(Collectors.toList());
        List<RecommendationOptionInfo> recommendationPackageDtos =
                recommendationCarPackages.stream()
                        .map(
                                recommendationCarPackage ->
                                        toRecommendationOptionInfo(
                                                recommendationCarPackage.getPackages()))
                        .collect(Collectors.toList());
        long totalPrice = recommendationCar.getPrice();

        return new RecommendationResponse(
                trim.getName(),
                carSpec.getPrice(),
                exteriorColor.getExteriorImgUrl() + "/image_001.png",
                "",
                "",
                "",
                carSpec.getEngine().getName(),
                carSpec.getEngine().getId(),
                carSpec.getDrivingSystem().getName(),
                carSpec.getDrivingSystem().getId(),
                carSpec.getBody().getName(),
                carSpec.getBody().getId(),
                carSpec.getId(),
                trim.getId(),
                toRecommendationColorInfo(exteriorColor),
                RecommendationColorInfoMapper.toRecommendationColorInfo(interiorColor),
                recommendationOptionInfos,
                recommendationPackageDtos,
                totalPrice);
    }

    public static RecommendationResponse toRecommendationResponse(
            RecommendationCar recommendationCar, Recommendation recommendation) {
        CarSpec carSpec = recommendationCar.getCarSpec();
        Trim trim = carSpec.getTrim();
        ExteriorColor exteriorColor = recommendationCar.getExteriorColor();
        InteriorColor interiorColor = recommendationCar.getInteriorColor();
        List<RecommendationCarOption> recommendationCarOptions =
                recommendationCar.getRecommendationCarOptions();
        List<RecommendationCarPackage> recommendationCarPackages =
                recommendationCar.getRecommendationCarPackages();
        List<RecommendationOptionInfo> recommendationOptionInfos =
                recommendationCarOptions.stream()
                        .map(
                                recommendationCarOption ->
                                        RecommendationOptionInfoMapper.toRecommendationOptionInfo(
                                                recommendationCarOption.getOption()))
                        .collect(Collectors.toList());
        List<RecommendationOptionInfo> recommendationPackageDtos =
                recommendationCarPackages.stream()
                        .map(
                                recommendationCarPackage ->
                                        toRecommendationOptionInfo(
                                                recommendationCarPackage.getPackages()))
                        .collect(Collectors.toList());
        long totalPrice = recommendationCar.getPrice();

        return new RecommendationResponse(
                trim.getName(),
                carSpec.getPrice(),
                exteriorColor.getExteriorImgUrl() + "/image_001.png",
                recommendation.getComment1(),
                recommendation.getComment2(),
                recommendation.getKeyword(),
                carSpec.getEngine().getName(),
                carSpec.getEngine().getId(),
                carSpec.getDrivingSystem().getName(),
                carSpec.getDrivingSystem().getId(),
                carSpec.getBody().getName(),
                carSpec.getBody().getId(),
                carSpec.getId(),
                trim.getId(),
                toRecommendationColorInfo(exteriorColor),
                RecommendationColorInfoMapper.toRecommendationColorInfo(interiorColor),
                recommendationOptionInfos,
                recommendationPackageDtos,
                totalPrice);
    }
}
