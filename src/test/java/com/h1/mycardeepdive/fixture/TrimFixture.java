package com.h1.mycardeepdive.fixture;

import com.h1.mycardeepdive.trims.domain.Trim;

public class TrimFixture {
    private TrimFixture() {}

    public static Trim createExclusiveTrim() {
        Long id = 1L;
        String name = "Exclusive";
        String imgUrl = "/trims/exclusive";
        String wheelName = "기본 휠";
        double wheelSize = 18;
        String seatName = "인조/천연가죽 시트";
        double navigationSize = 12.3;
        double clusterSize = 4.2;
        String summary = "합리적인 당신을 위한";

        return Trim.builder()
                .id(id)
                .name(name)
                .imgUrl(imgUrl)
                .wheelName(wheelName)
                .wheelSize(wheelSize)
                .seatName(seatName)
                .navigationSize(navigationSize)
                .clusterSize(clusterSize)
                .summary(summary)
                .build();
    }
}
