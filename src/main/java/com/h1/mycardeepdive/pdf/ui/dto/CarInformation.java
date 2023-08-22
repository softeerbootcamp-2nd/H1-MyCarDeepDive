package com.h1.mycardeepdive.pdf.ui.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CarInformation {
    private String car_name;
    private String engine_name;
    private String driving_system_name;
    private String trim_name;
    private String body_name;
    private String exterior_color_name;
    private String exterior_color_img_url;
    private long exterior_color_price;
    private String interior_color_name;
    private String interior_color_img_url;
    private long interior_color_price;
    private List<SimpleOption> option_list;
    private long basic_price;
    private String pdf_url;
    private Long total_price;
}
