package com.h1.mycardeepdive.car.domain;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class CarTest {

    @Test
    @DisplayName("빌더 패턴을 통해 차종을 생성할 수 있다.")
    void createCar() {
        // given
        long idx = 0L;
        String name = "팰리세이드";
        String comment = "매우 좋은 현대차";

        // when
        Car car = Car.builder().id(idx).name(name).comment(comment).build();

        // then
        assertEquals(car.getId(), idx);
        assertEquals(car.getName(), name);
        assertEquals(car.getComment(), comment);
    }

    @DisplayName("Car 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void carEqualsById() {
        // given
        Long id = 1L;

        // when
        Car car1 = Car.builder().build();
        Car car2 = Car.builder().build();
        Set<Car> carSet = new HashSet<>(List.of(car1, car2));

        // then
        assertThat(car1).isEqualTo(car2);
        assertThat(car1.hashCode()).isEqualTo(car2.hashCode());
        assertThat(carSet.size()).isEqualTo(1);
    }
}
