package com.h1.mycardeepdive.car.ui.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CarSpecResponse {
    private String trims_name;
    private long price;
    private String summary;
    private Long car_spec_id;
    private Long trims_id;
    private List<String> basic_option_names;
    private List<Long> basic_option_ids;
}
