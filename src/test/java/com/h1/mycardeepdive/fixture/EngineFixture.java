package com.h1.mycardeepdive.fixture;

import com.h1.mycardeepdive.car.domain.Engine;

public class EngineFixture {
    private EngineFixture() {}

    public static Engine createDieselEngine() {
        Long id = 1L;
        String name = "디젤 2.2";
        String imgUrl = "/engine/dieselengine2.2";
        String description = "높은 토크로 파워풀한 드라이빙이 가능하며, 차급대비 연비 효율이 우수합니다.";
        String maxPower = "202/3,800PS/rpm";
        String maxTorque = "45.0/1,750~2,750kgf-m/rpm";

        return Engine.builder()
                .id(id)
                .name(name)
                .imgUrl(imgUrl)
                .description(description)
                .maxPower(maxPower)
                .maxTorque(maxTorque)
                .build();
    }
}
