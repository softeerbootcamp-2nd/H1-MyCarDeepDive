package com.h1.mycardeepdive.recommendation.ui.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class RecommendationOptionInfo {
    private long option_id;
    private String option_name;
    private String option_img_url;
    private long option_price;
    private String option_comment;
}
