package com.h1.mycardeepdive.recommendation.ui.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class RecommendationResponse {
    private String trim_name;
    private String car_img_url;
    private String comment1;
    private String comment2;
    private String keyword;
    private String engine_name;
    private String driving_system_name;
    private String body_name;
    private long car_spec_id;
    private long trim_id;
    RecommendationColorDto exterior_color;
    RecommendationColorDto interior_color;
    List<RecommendationOptionDto> options;
    List<RecommendationOptionDto> packages;
    private long totalPrice;
}
