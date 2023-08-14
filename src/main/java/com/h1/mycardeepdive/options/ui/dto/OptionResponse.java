package com.h1.mycardeepdive.options.ui.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class OptionResponse {
    private List<PackageOptionResponse> optionPackageList;
    private List<AdditionalOptionResponse> additionalOptionList;
}
