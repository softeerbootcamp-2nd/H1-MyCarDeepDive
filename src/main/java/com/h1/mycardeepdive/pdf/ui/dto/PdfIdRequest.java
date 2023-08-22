package com.h1.mycardeepdive.pdf.ui.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PdfIdRequest {
    private Long car_spec_id;
    private Long trim_id;
    private Long exterior_color_id;
    private Long interior_color_id;
    private List<Long> additional_option_id_list;
}
