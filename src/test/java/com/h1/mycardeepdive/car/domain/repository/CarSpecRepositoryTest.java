package com.h1.mycardeepdive.car.domain.repository;

import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.car.domain.CarSpec;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
class CarSpecRepositoryTest {

    @Autowired CarSpecRepository carSpecRepository;

    @BeforeEach
    void setUp() {
        carSpecRepository.deleteAll();
    }

    @DisplayName("이미 DB에 저장되어 있는 ID를 가진 차량사양을 저장하면, 해당 ID의 차량사양은 후에 작성된 차량사양 정보로 업데이트 된다.")
    @Test
    void saveSameId() {
        // given
        CarSpec carSpec1 = CarSpec.builder().build();
        carSpecRepository.save(carSpec1);

        // when
        CarSpec carSpec2 = CarSpec.builder().id(carSpec1.getId()).build();
        carSpecRepository.save(carSpec2);

        // then
        List<CarSpec> savedCarSpec = carSpecRepository.findAll();
        assertEquals(savedCarSpec.size(), 1);
    }

    @DisplayName("id가 없는 CarSpec 엔티티를 저장하면 순차적으로 ID를 부여하여 저장한다.")
    @Test
    void saveNoIdArtist() {
        // given
        CarSpec carSpec1 = CarSpec.builder().build();
        CarSpec carSpec2 = CarSpec.builder().build();

        // when
        carSpecRepository.save(carSpec1);
        carSpecRepository.save(carSpec2);

        // then
        long idDiff = carSpec2.getId() - carSpec1.getId();
        assertEquals(idDiff, 1L);
    }
}
