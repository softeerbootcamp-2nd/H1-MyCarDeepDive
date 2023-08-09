package com.h1.mycardeepdive.car.domain.repository;

import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.car.domain.Car;
import java.util.List;
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
    public void testSameId() throws Exception {
        // given
        Car car1 =
                Car.builder().id(0L).name("그랜저IG").price(1000000000).comment("매우 좋은 현대차").build();
        carRepository.save(car1);

        // when
        Car car2 =
                Car.builder().id(1L).name("그랜저IG").price(1000000000).comment("매우 좋은 현대차").build();
        carRepository.save(car2);

        // then
        List<Car> carList = carRepository.findAll();
        assertEquals(carList.get(0).getId() - carList.get(1).getId(), 1);
    }
}
