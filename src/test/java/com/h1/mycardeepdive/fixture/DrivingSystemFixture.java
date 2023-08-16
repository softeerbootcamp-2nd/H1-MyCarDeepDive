package com.h1.mycardeepdive.fixture;

import com.h1.mycardeepdive.car.domain.DrivingSystem;

public class DrivingSystemFixture {
    private DrivingSystemFixture() {}

    public static DrivingSystem create2WDDrivingSystem() {
        Long id = 1L;
        String name = "2WD";
        String imgUrl = "/driving_system/2wd";
        String description =
                "엔진에서 전달되는 동력이 전/후륜 바퀴 중 한쪽으로만 전달되어 차량을 움직이는 방식입니다. 차체가 가벼워 연료 효율이 높습니다.";

        return DrivingSystem.builder()
                .id(id)
                .name(name)
                .imgUrl(imgUrl)
                .description(description)
                .build();
    }
}
