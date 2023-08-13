package com.h1.mycardeepdive.options.ui.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PackageOptionResponse {
    private Long id;

    private String option_img_url;

    private double option_select_rate;

    private String option_name;

    private String option_summary;

    private List<String> tag_list;

    private String badge_name;

    private long price;
}
