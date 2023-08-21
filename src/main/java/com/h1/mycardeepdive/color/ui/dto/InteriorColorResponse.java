package com.h1.mycardeepdive.color.ui.dto;

import java.util.List;
import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class InteriorColorResponse {
    List<InteriorColorInfo> available_colors;
    List<InteriorColorInfo> unavailable_colors;
    List<InteriorColorInfo> other_trim_colors;
}
