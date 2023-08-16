package com.h1.mycardeepdive.car.ui.dto;

import java.util.List;
import lombok.*;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CarSpecResponse {
    private String trim_name;
    private long price;
    private String summary;
    private Long car_spec_id;
    private Long trim_id;
    private List<String> basic_option_names;
    private List<Long> basic_option_ids;
}
