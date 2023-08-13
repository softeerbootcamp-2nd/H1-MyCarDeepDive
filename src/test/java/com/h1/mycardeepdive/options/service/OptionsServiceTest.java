package com.h1.mycardeepdive.options.service;

import static com.h1.mycardeepdive.fixture.OptionFixture.*;
import static com.h1.mycardeepdive.fixture.PackageFixture.createPackageComfortII;
import static com.h1.mycardeepdive.fixture.TagsFixture.createSafetyTag;
import static org.junit.jupiter.api.Assertions.assertEquals;

import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.car.domain.repository.CarSpecRepository;
import com.h1.mycardeepdive.options.domain.*;
import com.h1.mycardeepdive.options.domain.Packages;
import com.h1.mycardeepdive.options.domain.repository.*;
import com.h1.mycardeepdive.options.ui.dto.OptionResponse;
import com.h1.mycardeepdive.tags.domain.Tags;
import com.h1.mycardeepdive.tags.domain.repository.TagRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@SpringBootTest
class OptionsServiceTest {

    @Autowired OptionsRepository optionsRepository;
    @Autowired PackageRepository packageRepository;
    @Autowired OptionPackageRepository optionPackageRepository;
    @Autowired TagRepository tagRepository;
    @Autowired CarSpecRepository carSpecRepository;
    @Autowired CarSpecOptionsRepository carSpecOptionsRepository;
    @Autowired CarSpecPackageRepository carSpecPackageRepository;
    @Autowired OptionsService optionsService;

    private Options optionBuiltInCam;
    private Options optionStopSystem;
    private Options optionDarkWheel;
    private Packages comfortIIPackages;
    private Tags tags1;
    private OptionPackage optionPackageComfortII;
    private CarSpec carSpec;
    private CarSpecOptions carSpecOptions1;
    private CarSpecOptions carSpecOptions2;
    private CarSpecPackage carSpecPackage;

    @BeforeEach
    void setUp() {
        optionsRepository.deleteAll();
        packageRepository.deleteAll();
        optionPackageRepository.deleteAll();
        tagRepository.deleteAll();
        carSpecRepository.deleteAll();
        carSpecOptionsRepository.deleteAll();
        carSpecPackageRepository.deleteAll();

        carSpec = CarSpec.builder().build();
        carSpec = carSpecRepository.save(carSpec);

        optionBuiltInCam = createOptionBuiltInCam();
        optionStopSystem = createOptionStopSystem();
        optionDarkWheel = createOptionDarkWheel();
        optionBuiltInCam = optionsRepository.save(optionBuiltInCam);
        optionStopSystem = optionsRepository.save(optionStopSystem);
        optionDarkWheel = optionsRepository.save(optionDarkWheel);

        comfortIIPackages = createPackageComfortII();
        comfortIIPackages = packageRepository.save(comfortIIPackages);

        tags1 = createSafetyTag();
        tags1 = tagRepository.save(tags1);

        optionPackageComfortII =
                OptionPackage.builder()
                        .packages(comfortIIPackages)
                        .option(optionBuiltInCam)
                        .build();
        optionPackageComfortII = optionPackageRepository.save(optionPackageComfortII);

        carSpecOptions1 =
                CarSpecOptions.builder().carSpec(carSpec).options(optionBuiltInCam).build();
        carSpecOptions1 = carSpecOptionsRepository.save(carSpecOptions1);
        carSpecOptions2 =
                CarSpecOptions.builder().carSpec(carSpec).options(optionStopSystem).build();
        carSpecOptions2 = carSpecOptionsRepository.save(carSpecOptions2);

        carSpecPackage =
                CarSpecPackage.builder().carSpec(carSpec).packages(comfortIIPackages).build();
        carSpecPackage = carSpecPackageRepository.save(carSpecPackage);
    }

    @DisplayName("차사양에 해당하는 추가 옵션들을 전부 조회한다.")
    @Test
    void findAllAdditionalOptions() {
        // given

        // when
        OptionResponse options = optionsService.findAllAdditionalOptions(carSpec.getId());

        // then
        assertEquals(options.getOptionPackageList().size(), 1);
        assertEquals(options.getAdditionalOptionList().size(), 1);
    }
}
