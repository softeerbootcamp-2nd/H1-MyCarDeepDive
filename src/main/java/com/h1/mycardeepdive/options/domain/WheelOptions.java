package com.h1.mycardeepdive.options.domain;

import javax.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Getter
public class WheelOptions {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int wheelSize;
    private String optionsImageUrl;
    private String optionsName;
    private String optionsDescription;
    private Long optionsPrice;
    private String optionsSummary;
    private boolean isBasicOption;

    @Enumerated(EnumType.STRING)
    private OptionsSort optionSort;
}
