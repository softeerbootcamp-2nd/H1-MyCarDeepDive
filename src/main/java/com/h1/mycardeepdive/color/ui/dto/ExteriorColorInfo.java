package com.h1.mycardeepdive.color.ui.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ExteriorColorInfo {
    private long color_id;
    private long trim_id;
    private String trim_name;
    private String name;
    private String img_url;
    private List<String> car_img_urls;
    private long price;
    private double choose_rate;
}
