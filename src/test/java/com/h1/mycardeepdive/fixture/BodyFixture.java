package com.h1.mycardeepdive.fixture;

import com.h1.mycardeepdive.car.domain.Body;

public class BodyFixture {
    private BodyFixture() {}

    public static Body create7Body() {
        Long id = 1L;
        String name = "7인승";
        String imgUrl = "/body/7seats";
        String description =
                "기존 8인승 시트(1열 2명, 2열 3명, 3열 3명)에서 2열 가운데 시트를 없애 2열 탑승객의 편의는 물론, 3열 탑승객의 승하차가 편리합니다.";

        return Body.builder().id(id).name(name).imgUrl(imgUrl).description(description).build();
    }
}
