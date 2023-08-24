package com.h1.mycardeepdive.color.ui.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ColorResponse {
    List<ColorInfo> available_colors;
    List<ColorInfo> unavailable_colors;
    List<ColorInfo> other_trim_colors;
}
