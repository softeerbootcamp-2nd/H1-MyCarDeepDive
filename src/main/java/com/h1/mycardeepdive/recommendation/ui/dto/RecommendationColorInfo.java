package com.h1.mycardeepdive.recommendation.ui.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class RecommendationColorInfo {
    private long color_id;
    private String color_name;
    private long color_price;
    private String color_comment;
    private String color_icon_url;
}
