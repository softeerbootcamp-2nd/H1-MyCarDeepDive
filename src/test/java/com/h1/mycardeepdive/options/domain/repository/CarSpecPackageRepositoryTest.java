package com.h1.mycardeepdive.options.domain.repository;

import static com.h1.mycardeepdive.fixture.PackageFixture.createPackageComfortII;
import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.car.domain.repository.CarSpecRepository;
import com.h1.mycardeepdive.options.domain.CarSpecPackage;
import com.h1.mycardeepdive.options.domain.Package;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
class CarSpecPackageRepositoryTest {
    @Autowired CarSpecPackageRepository carSpecPackageRepository;

    @Autowired CarSpecRepository carSpecRepository;

    @Autowired PackageRepository packageRepository;

    private Package aPackage;
    private CarSpec carSpec;

    @BeforeEach
    void setUp() {
        carSpecPackageRepository.deleteAll();
        carSpecRepository.deleteAll();
        packageRepository.deleteAll();

        aPackage = createPackageComfortII();
        aPackage = packageRepository.save(aPackage);

        carSpec = CarSpec.builder().build();
        carSpec = carSpecRepository.save(carSpec);
    }

    @DisplayName(
            "이미 DB에 저장되어 있는 ID를 가진 CarSpecPackage을 저장하면, 해당 ID의 CarSpecPackage는 후에 작성된 CarSpecPackage 정보로 업데이트 된다.")
    @Test
    void saveSameId() {
        // given
        CarSpecPackage carSpecPackage1 =
                CarSpecPackage.builder().carSpec(carSpec)._package(aPackage).build();
        carSpecPackageRepository.save(carSpecPackage1);

        // when
        CarSpecPackage carSpecPackage2 =
                CarSpecPackage.builder().id(carSpecPackage1.getId()).carSpec(carSpec).build();
        carSpecPackageRepository.save(carSpecPackage2);

        // then
        List<CarSpecPackage> carSpecPackageList = carSpecPackageRepository.findAll();
        assertEquals(carSpecPackageList.size(), 1);
    }

    @DisplayName("id가 없는 옵션패키지 엔티티를 저장하면 순차적으로 ID를 부여하여 저장한다.")
    @Test
    void saveNoIdCarSpecOptionsPackage() {
        // given
        CarSpecPackage carSpecPackage1 = CarSpecPackage.builder().carSpec(carSpec).build();
        CarSpecPackage carSpecOptions2 = CarSpecPackage.builder().carSpec(carSpec).build();

        // when
        carSpecPackageRepository.save(carSpecPackage1);
        carSpecPackageRepository.save(carSpecOptions2);

        // then
        long idDiff = carSpecOptions2.getId() - carSpecPackage1.getId();
        assertEquals(idDiff, 1L);
    }
}
