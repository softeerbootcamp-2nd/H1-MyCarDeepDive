package com.h1.mycardeepdive.recommendation.mapper;

import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.color.domain.ExteriorColor;
import com.h1.mycardeepdive.color.domain.InteriorColor;
import com.h1.mycardeepdive.recommendation.domain.Recommendation;
import com.h1.mycardeepdive.recommendation.domain.RecommendationCar;
import com.h1.mycardeepdive.recommendation.domain.RecommendationCarOption;
import com.h1.mycardeepdive.recommendation.domain.RecommendationCarPackage;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationOptionDto;
import com.h1.mycardeepdive.recommendation.ui.dto.RecommendationResponse;
import com.h1.mycardeepdive.trims.domain.Trim;

import java.util.List;
import java.util.stream.Collectors;

import static com.h1.mycardeepdive.recommendation.mapper.RecommendationOptionDtoMapper.toRecommendationOptionDto;

public class RecommendationMapper {
    public static RecommendationResponse toRecommendationResponse(Recommendation recommendation) {
        RecommendationCar recommendationCar = recommendation.getRecommendationCar();
        CarSpec carSpec = recommendationCar.getCarSpec();
        Trim trim = carSpec.getTrim();
        ExteriorColor exteriorColor = recommendationCar.getExteriorColor();
        InteriorColor interiorColor = recommendationCar.getInteriorColor();
        List<RecommendationCarOption> recommendationCarOptions = recommendationCar.getRecommendationCarOptions();
        List<RecommendationCarPackage> recommendationCarPackages = recommendationCar.getRecommendationCarPackages();
        List<RecommendationOptionDto> recommendationOptionDtos = recommendationCarOptions
                .stream()
                .map(recommendationCarOption -> toRecommendationOptionDto(recommendationCarOption.getOption()))
                .collect(Collectors.toList());
        List<RecommendationOptionDto> recommendationPackageDtos = recommendationCarPackages
                .stream()
                .map(recommendationCarPackage -> toRecommendationOptionDto(recommendationCarPackage.getPackages()))
                .collect(Collectors.toList());
        long totalPrice = carSpec.getPrice() +
                exteriorColor.getPrice() +
                interiorColor.getPrice() +
                recommendationOptionDtos.stream()
                        .mapToLong(RecommendationOptionDto::getPrice)
                        .sum() +
                recommendationPackageDtos.stream()
                        .mapToLong(RecommendationOptionDto::getPrice)
                        .sum();

        return new RecommendationResponse(
                trim.getName(),
                exteriorColor.getExteriorImgUrl() + "/image_001.png",
                recommendationCar.getComment1(),
                recommendationCar.getComment2(),
                recommendationCar.getKeyword(),
                carSpec.getEngine().getName(),
                carSpec.getDrivingSystem().getName(),
                carSpec.getBody().getName(),
                carSpec.getId(),
                trim.getId(),
                exteriorColor.getId(),
                exteriorColor.getName(),
                exteriorColor.getPrice(),
                exteriorColor.getComment(),
                exteriorColor.getImgUrl(),
                interiorColor.getId(),
                interiorColor.getName(),
                interiorColor.getPrice(),
                interiorColor.getComment(),
                interiorColor.getImgUrl(),
                recommendationOptionDtos,
                recommendationPackageDtos,
                totalPrice
        );
    }
}
