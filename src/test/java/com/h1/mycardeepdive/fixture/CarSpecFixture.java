package com.h1.mycardeepdive.fixture;

import static com.h1.mycardeepdive.fixture.BodyFixture.create7Body;
import static com.h1.mycardeepdive.fixture.DrivingSystemFixture.create2WDDrivingSystem;
import static com.h1.mycardeepdive.fixture.EngineFixture.createDieselEngine;
import static com.h1.mycardeepdive.fixture.TrimFixture.createExclusiveTrim;

import com.h1.mycardeepdive.car.domain.*;

public class CarSpecFixture {
    private CarSpecFixture() {}

    public static CarSpec createCarSpecD72E() {
        Long id = 1L;
        int price = 43200000;

        return CarSpec.builder()
                .id(id)
                .engine(createDieselEngine())
                .body(create7Body())
                .drivingSystem(create2WDDrivingSystem())
                .trim(createExclusiveTrim())
                .price(price)
                .build();
    }
}
