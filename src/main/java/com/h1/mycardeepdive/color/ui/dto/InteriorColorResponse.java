package com.h1.mycardeepdive.color.ui.dto;

import java.util.Map;
import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class InteriorColorResponse {
    Map<Long, InteriorColorInfo> available_colors;
    Map<Long, InteriorColorInfo> unavailable_colors;
    Map<Long, InteriorColorInfo> other_trim_colors;
}
