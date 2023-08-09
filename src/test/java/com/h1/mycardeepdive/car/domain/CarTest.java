package com.h1.mycardeepdive.car.domain;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;


class CarTest {

    @BeforeEach
    private void setup() {

    }

    @Test
    @DisplayName("빌더 패턴을 통해 차종을 생성할 수 있다.")
    private void createCar() {
        // given
        long idx = 0L;
        String name = "팰리세이드";


        // when
        Car car = Car.builder()
                .id(idx)
                .name(name)
                .price(1000000000)
                .comment("매우 좋은 현대차")
                .build();

        // then
        assertEquals(car.getId(), idx);
        assertEquals(car.getName(), name);
    }
}