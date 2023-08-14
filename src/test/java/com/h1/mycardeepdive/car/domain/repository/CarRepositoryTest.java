package com.h1.mycardeepdive.car.domain.repository;

import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.car.domain.Car;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
class CarRepositoryTest {

    @Autowired private CarRepository carRepository;

    @BeforeEach
    void setUp() {
        carRepository.deleteAll();
    }

    @Test
    @DisplayName("이미 DB에 저장되어 있는 ID를 가진 차종을 저장하면, 해당 ID의 차종은 후에 작성된 그룹 정보로 업데이트 된다.")
    public void testSameIdUpdate() throws Exception {
        // given
        Car car1 = Car.builder().name("그랜저IG1").comment("매우 좋은 현대차").build();
        carRepository.save(car1);

        // when
        Car car2 = Car.builder().id(car1.getId()).name("그랜저IG2").comment("매우 좋은 현대차").build();
        carRepository.save(car2);

        // then
        assertEquals(car2.getName(), "그랜저IG2");
    }

    @Test
    @DisplayName("id가 없는 차종 엔티티를 저장하면 순차적으로 ID를 부여하여 저장한다.")
    public void saveNoIdMember() throws Exception {
        // given
        Car car1 = Car.builder().name("그랜저IG1").comment("매우 좋은 현대차").build();
        carRepository.save(car1);

        // when
        Car car2 = Car.builder().name("그랜저IG2").comment("매우 좋은 현대차").build();
        carRepository.save(car2);

        // then
        assertEquals(car2.getId() - car1.getId(), 1);
    }
}
