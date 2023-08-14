package com.h1.mycardeepdive.options.ui.dto;

import com.h1.mycardeepdive.tags.ui.TagResponse;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class OptionDetailResponse {
    private long option_id;
    private String option_name;
    private String option_description;
    private List<TagResponse> tag_list;
    private long price;
}
