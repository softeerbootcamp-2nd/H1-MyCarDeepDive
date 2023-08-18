package com.h1.mycardeepdive.options.ui.dto;

import com.h1.mycardeepdive.tags.ui.TagResponse;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PackageOptionResponse {
    private Long package_option_id;

    private String option_img_url;

    private double option_select_rate;

    private String option_name;

    private String option_summary;

    private List<TagResponse> tag_list;

    private String badge_name;

    private long price;

    private List<Long> additional_option_id_list;
}
