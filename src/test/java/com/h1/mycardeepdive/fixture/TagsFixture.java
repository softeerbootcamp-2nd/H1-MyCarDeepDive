package com.h1.mycardeepdive.fixture;

import com.h1.mycardeepdive.tags.domain.Tags;

public class TagsFixture {
    private TagsFixture() {
    }

    public static Tags createSafetyTag() {
        return Tags.builder()
                .name("주행안전")
                .img_url("safety_car.jpg")
                .build();
    }
}
