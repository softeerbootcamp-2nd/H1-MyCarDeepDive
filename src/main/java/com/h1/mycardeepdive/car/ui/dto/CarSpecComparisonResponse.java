package com.h1.mycardeepdive.car.ui.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CarSpecComparisonResponse {
    private String trims_img_url;
    private String summary;
    private String trims_name;
    private long price;
    private List<String> exterior_color_img_urls;
    private List<String> interior_color_names;
    private double wheel_size;
    private String wheel_name;
    private String seat_name;
    private double navigation_size;
    private double cluster_size;
    private List<String> basic_option_names;
}
