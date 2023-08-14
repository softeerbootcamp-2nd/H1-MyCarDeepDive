package com.h1.mycardeepdive.options.ui.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class OptionTagResponse {
    private String tag_img_url;
    private List<OptionCoordinatesResponse> options;
}
