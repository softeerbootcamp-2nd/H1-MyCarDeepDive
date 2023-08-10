package com.h1.mycardeepdive.fixture;

import com.h1.mycardeepdive.options.domain.Badge;
import com.h1.mycardeepdive.options.domain.Package;

public class PackageFixture {
    private PackageFixture() {}

    public static Package createPackageComfortII() {
        Long id = 0L;
        String name = "컴포트 II";
        double chooseRate = 5.5;
        String summary = "편의성을 위해 구성된 세트 옵션";
        long price = 10090000;

        return Package.builder()
                .id(id)
                .name(name)
                .chooseRate(chooseRate)
                .badgeName(Badge.H_GENUINE)
                .price(price)
                .summary(summary)
                .build();
    }
}
