package com.h1.mycardeepdive.options.ui.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class OptionCoordinatesResponse {
    private long option_id;
    private String option_name;
    private String option_description;
    private String option_img_url;
    private long price;
    private double position_x;
    private double position_y;
}
