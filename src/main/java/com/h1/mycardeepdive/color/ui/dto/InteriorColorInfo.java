package com.h1.mycardeepdive.color.ui.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class InteriorColorInfo {
    private String name;
    private long interior_color_id;
    private long price;
    private String img_url;
    private String car_img_url;
    private double choose_rate;
    private String trim_name;
    private long car_spec_price;
}
