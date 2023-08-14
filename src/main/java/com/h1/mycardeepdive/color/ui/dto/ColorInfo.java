package com.h1.mycardeepdive.color.ui.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ColorInfo {
    private String name;
    private String img_url;
    private String car_img_url;
    private double choose_rate;
}
