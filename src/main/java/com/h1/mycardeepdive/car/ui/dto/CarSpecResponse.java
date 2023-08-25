package com.h1.mycardeepdive.car.ui.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CarSpecResponse {
    private List<CarSpecInfo> car_specs;
    private long recommend_trim_id;
}
