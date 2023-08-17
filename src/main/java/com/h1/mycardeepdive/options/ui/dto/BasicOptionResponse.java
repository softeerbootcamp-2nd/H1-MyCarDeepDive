package com.h1.mycardeepdive.options.ui.dto;

import com.h1.mycardeepdive.tags.ui.TagResponse;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class BasicOptionResponse {
    private Long basic_option_id;

    private String option_img_url;

    private String option_name;

    private List<TagResponse> tag_list;
}
