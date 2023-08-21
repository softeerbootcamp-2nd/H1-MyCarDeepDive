package com.h1.mycardeepdive.color.ui.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class AllColorResponse {
    ExteriorColorResponse exterior_color_response;
    InteriorColorResponse interior_color_response;
}
