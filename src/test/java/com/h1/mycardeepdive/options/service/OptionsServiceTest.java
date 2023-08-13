package com.h1.mycardeepdive.options.service;

import static com.h1.mycardeepdive.fixture.OptionFixture.*;
import static com.h1.mycardeepdive.fixture.PackageFixture.createPackageComfortII;
import static com.h1.mycardeepdive.fixture.TagsFixture.createSafetyTag;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.car.domain.repository.CarSpecRepository;
import com.h1.mycardeepdive.options.domain.*;
import com.h1.mycardeepdive.options.domain.Packages;
import com.h1.mycardeepdive.options.domain.repository.*;
import com.h1.mycardeepdive.options.ui.dto.BasicOptionResponse;
import com.h1.mycardeepdive.options.ui.dto.OptionDetailResponse;
import com.h1.mycardeepdive.options.ui.dto.OptionResponse;
import com.h1.mycardeepdive.tags.domain.Tags;
import com.h1.mycardeepdive.tags.domain.repository.TagRepository;
import java.util.List;
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
    private CarSpecOptions carSpecOptions3;
    private CarSpecPackage carSpecPackage;

    @BeforeEach
    void setUp() {
        carSpecOptionsRepository.deleteAll();
        carSpecPackageRepository.deleteAll();
        optionPackageRepository.deleteAll();
        optionsRepository.deleteAll();
        packageRepository.deleteAll();
        tagRepository.deleteAll();
        carSpecRepository.deleteAll();

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
                CarSpecOptions.builder()
                        .carSpec(carSpec)
                        .options(optionBuiltInCam)
                        .isBasicOption(false)
                        .build();
        carSpecOptions1 = carSpecOptionsRepository.save(carSpecOptions1);
        carSpecOptions2 =
                CarSpecOptions.builder()
                        .carSpec(carSpec)
                        .options(optionDarkWheel)
                        .isBasicOption(false)
                        .build();
        carSpecOptions2 = carSpecOptionsRepository.save(carSpecOptions2);
        carSpecOptions3 =
                CarSpecOptions.builder()
                        .carSpec(carSpec)
                        .options(optionStopSystem)
                        .isBasicOption(true)
                        .build();
        carSpecOptions3 = carSpecOptionsRepository.save(carSpecOptions3);

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

    @DisplayName("차사양에 해당하는 기본 옵션들을 전부 조회한다.")
    @Test
    void findAllBasicOptions() {
        // given

        // when
        List<BasicOptionResponse> basicOptions =
                optionsService.findAllBasicOptions(carSpec.getId());

        // then
        assertEquals(basicOptions.size(), 1);
    }

    @DisplayName("옵션 로그 전송에 성공한다.")
    @Test
    void sendUserOptionClickLog() {
        // given
        boolean result = optionsService.userClickedOptionLog(optionBuiltInCam.getId());

        // when&then
        assertTrue(result);
    }

    @DisplayName("패키지옵션 로그 전송에 성공한다.")
    @Test
    void sendUserPackageClickLog() {
        // given
        boolean result = optionsService.userClickedPackageLog(optionPackageComfortII.getId());

        // when&then
        assertTrue(result);
    }

    @DisplayName("패키지옵션에 포함된 옵션들 조회에 성공한다.")
    @Test
    void findPackageOptionDetailTest() {
        // given
        List<OptionDetailResponse> packageOptionDetail =
                optionsService.findPackageOptionDetail(optionPackageComfortII.getId());

        // when&then
        assertEquals(packageOptionDetail.size(), 1);
        assertEquals(packageOptionDetail.get(0).getOption_name(), optionBuiltInCam.getName());
    }

    @DisplayName("단일 옵션 상세 조회에 성공한다.")
    @Test
    void findOptionDetailTest() {
        // given
        OptionDetailResponse optionDetail =
                optionsService.findOptionDetail(optionBuiltInCam.getId());

        // when&then
        assertEquals(optionDetail.getOption_name(), optionBuiltInCam.getName());
        assertEquals(optionDetail.getOption_description(), optionBuiltInCam.getDescription());
    }
}
