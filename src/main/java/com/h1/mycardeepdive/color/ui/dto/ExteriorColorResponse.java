package com.h1.mycardeepdive.color.ui.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ExteriorColorResponse {
    List<ExteriorColorInfo> available_colors;
    List<ExteriorColorInfo> unavailable_colors;
    List<ExteriorColorInfo> other_trim_colors;
}
