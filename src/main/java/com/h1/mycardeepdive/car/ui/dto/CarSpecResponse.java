package com.h1.mycardeepdive.car.ui.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CarSpecResponse {
    List<CarSpecInfo> car_specs;
    long recommend_trim_id;
}
