package com.h1.mycardeepdive.color.ui.dto;

import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ExteriorColorResponse {
    Map<Long, ExteriorColorInfo> available_colors;
    Map<Long, ExteriorColorInfo> unavailable_colors;
    Map<Long, ExteriorColorInfo> other_trim_colors;
}
