package com.h1.mycardeepdive.color.ui.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExteriorColorInfo {
    private String name;
    private long exterior_color_id;
    private long price;
    private String img_url;
    private List<String> car_img_urls;
    private double choose_rate;
    private String trim_name;
    private long car_spec_price;
}
