package com.h1.mycardeepdive.options.domain.repository;

import static com.h1.mycardeepdive.fixture.OptionFixture.createOptionBuiltInCam;
import static com.h1.mycardeepdive.fixture.OptionFixture.createOptionStopSystem;
import static com.h1.mycardeepdive.fixture.PackageFixture.createPackageComfortII;
import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.options.domain.OptionPackage;
import com.h1.mycardeepdive.options.domain.Options;
import com.h1.mycardeepdive.options.domain.Packages;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
class OptionPackagesRepositoryTest {
    @Autowired OptionPackageRepository optionPackageRepository;

    @Autowired OptionsRepository optionsRepository;

    @Autowired PackageRepository packageRepository;

    private Options option1;
    private Options option2;
    private Packages _packages1;

    @BeforeEach
    void setUp() {
        optionPackageRepository.deleteAll();
        packageRepository.deleteAll();
        optionsRepository.deleteAll();

        option1 = createOptionBuiltInCam();
        option2 = createOptionStopSystem();
        option1 = optionsRepository.save(option1);
        option2 = optionsRepository.save(option2);

        _packages1 = createPackageComfortII();
        _packages1 = packageRepository.save(_packages1);
    }

    @DisplayName("이미 DB에 저장되어 있는 ID를 가진 옵션패키지을 저장하면, 해당 ID의 옵션패키지는 후에 작성된 옵션패키지 정보로 업데이트 된다.")
    @Test
    void saveSameId() {
        // given
        OptionPackage optionPackage1 =
                OptionPackage.builder().packages(_packages1).option(option1).build();
        optionPackageRepository.save(optionPackage1);

        // when
        OptionPackage optionPackage2 =
                OptionPackage.builder()
                        .id(optionPackage1.getId())
                        .packages(_packages1)
                        .option(option2)
                        .build();
        optionPackageRepository.save(optionPackage2);

        // then
        List<OptionPackage> savedOptionsPackage = optionPackageRepository.findAll();
        assertEquals(savedOptionsPackage.size(), 1);
    }

    @DisplayName("id가 없는 옵션패키지 엔티티를 저장하면 순차적으로 ID를 부여하여 저장한다.")
    @Test
    void saveNoIdOptionPackage() {
        // given
        OptionPackage optionPackage1 =
                OptionPackage.builder().packages(_packages1).option(option1).build();
        OptionPackage optionPackage2 =
                OptionPackage.builder().packages(_packages1).option(option2).build();

        // when
        optionPackageRepository.save(optionPackage1);
        optionPackageRepository.save(optionPackage2);

        // then
        long idDiff = optionPackage2.getId() - optionPackage1.getId();
        assertEquals(idDiff, 1L);
    }
}
