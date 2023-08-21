package com.h1.mycardeepdive.color.ui.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class InteriorColorInfo {
    private long color_id;
    private long trim_id;
    private String trim_name;
    private String name;
    private String img_url;
    private String car_img_url;
    private long price;
    private double choose_rate;
}
