package com.h1.mycardeepdive.recommendation.ui.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

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
    private long exterior_color_id;
    private String exterior_color_name;
    private long exterior_color_price;
    private String exterior_color_comment;
    private String exterior_color_icon_url;
    private long interior_color_id;
    private String interior_color_name;
    private long interior_color_price;
    private String interior_color_comment;
    private String interior_color_icon_url;
    List<RecommendationOptionDto> options;
    List<RecommendationOptionDto> packages;
    private long totalPrice;
}
