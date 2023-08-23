package com.h1.mycardeepdive.car.ui.dto;

import java.util.List;
import lombok.*;

@Getter
@AllArgsConstructor
public class CarSpecInfo {
    private String trim_name;
    private long price;
    private String summary;
    private long car_spec_id;
    private long trim_id;
    private String trim_img_url;
    private List<String> exterior_color_img_urls;
    private List<String> interior_color_img_urls;
    private List<String> basic_option_names;
    private List<Long> basic_option_ids;
    private List<String> basic_option_urls;
}
