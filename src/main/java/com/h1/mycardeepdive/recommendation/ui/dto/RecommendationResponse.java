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
    private long engine_id;
    private String driving_system_name;
    private long driving_system_id;
    private String body_name;
    private long body_id;
    private long car_spec_id;
    private long trim_id;
    RecommendationColorInfo exterior_color;
    RecommendationColorInfo interior_color;
    List<RecommendationOptionInfo> options;
    List<RecommendationOptionInfo> packages;
    private long total_price;
}
