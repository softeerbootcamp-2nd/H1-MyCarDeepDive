package com.h1.mycardeepdive.recommendation.ui.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class RecommendationOptionDto {
    private long option_id;
    private String option_name;
    private String option_img_url;
    private long price;
    private String comment;
}
