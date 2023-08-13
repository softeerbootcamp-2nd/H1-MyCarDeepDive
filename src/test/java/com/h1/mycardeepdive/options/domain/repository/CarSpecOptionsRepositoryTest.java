package com.h1.mycardeepdive.options.domain.repository;

import static com.h1.mycardeepdive.fixture.OptionFixture.createOptionBuiltInCam;
import static com.h1.mycardeepdive.fixture.OptionFixture.createOptionStopSystem;
import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.car.domain.repository.CarSpecRepository;
import com.h1.mycardeepdive.options.domain.CarSpecOptions;
import com.h1.mycardeepdive.options.domain.Options;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
class CarSpecOptionsRepositoryTest {
    @Autowired CarSpecOptionsRepository carSpecOptionsRepository;

    @Autowired CarSpecRepository carSpecRepository;

    @Autowired OptionsRepository optionsRepository;

    private Options option1;
    private Options option2;
    private CarSpec carSpec;

    @BeforeEach
    void setUp() {
        carSpecOptionsRepository.deleteAll();
        carSpecRepository.deleteAll();
        optionsRepository.deleteAll();

        option1 = createOptionBuiltInCam();
        option2 = createOptionStopSystem();
        option1 = optionsRepository.save(option1);
        option2 = optionsRepository.save(option2);

        carSpec = CarSpec.builder().build();
        carSpec = carSpecRepository.save(carSpec);
    }

    @DisplayName(
            "이미 DB에 저장되어 있는 ID를 가진 CarSpecOptions을 저장하면, 해당 ID의 CarSpecOptions는 후에 작성된 CarSpecOptions 정보로 업데이트 된다.")
    @Test
    void saveSameId() {
        // given
        CarSpecOptions carSpecOptions1 =
                CarSpecOptions.builder().carSpec(carSpec).options(option1).build();
        carSpecOptionsRepository.save(carSpecOptions1);

        // when
        CarSpecOptions carSpecOptions2 =
                CarSpecOptions.builder()
                        .id(carSpecOptions1.getId())
                        .carSpec(carSpec)
                        .options(option2)
                        .build();
        carSpecOptionsRepository.save(carSpecOptions2);

        // then
        List<CarSpecOptions> carSpecOptionsList = carSpecOptionsRepository.findAll();
        assertEquals(carSpecOptionsList.size(), 1);
    }

    @DisplayName("id가 없는 옵션패키지 엔티티를 저장하면 순차적으로 ID를 부여하여 저장한다.")
    @Test
    void saveNoIdCarSpecOptionsPackage() {
        // given
        CarSpecOptions carSpecOptions1 =
                CarSpecOptions.builder().options(option1).carSpec(carSpec).build();
        CarSpecOptions carSpecOptions2 =
                CarSpecOptions.builder().options(option2).carSpec(carSpec).build();

        // when
        carSpecOptionsRepository.save(carSpecOptions1);
        carSpecOptionsRepository.save(carSpecOptions2);

        // then
        long idDiff = carSpecOptions2.getId() - carSpecOptions1.getId();
        assertEquals(idDiff, 1L);
    }
}
