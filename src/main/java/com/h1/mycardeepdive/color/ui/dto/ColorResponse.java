package com.h1.mycardeepdive.color.ui.dto;

import java.util.List;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ColorResponse {
    List<ColorInfo> available_colors;
    List<ColorInfo> unavailable_colors;
}
