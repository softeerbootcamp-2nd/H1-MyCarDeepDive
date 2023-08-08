package com.h1.mycardeepdive.options.ui.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class WheelOptionResponse {
    private Long wheel_id;
    private int wheel_size;
    private String wheel_image_url;
    private String wheel_name;
    private String wheel_description;
    private Long wheel_price;
    private String wheel_summary;
}
