package com.h1.mycardeepdive.pdf.ui.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class SimpleOption {
    private String option_name;
    private Long option_price;
    private String option_img_url;
}
