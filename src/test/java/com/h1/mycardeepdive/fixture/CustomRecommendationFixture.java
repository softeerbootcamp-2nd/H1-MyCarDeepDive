package com.h1.mycardeepdive.fixture;

import static com.h1.mycardeepdive.fixture.CarSpecFixture.createCarSpecD72E;
import static com.h1.mycardeepdive.fixture.CustomRecommendationCarFixture.createCustomRecommendationCar;
import static com.h1.mycardeepdive.fixture.ExteriorColorFixture.createExteriorColor;
import static com.h1.mycardeepdive.fixture.InteriorColorFixture.createInteriorColor;
import static com.h1.mycardeepdive.fixture.OptionFixture.createOptionBuiltInCam;

import com.h1.mycardeepdive.options.domain.OptionPackage;
import com.h1.mycardeepdive.options.domain.Options;
import com.h1.mycardeepdive.options.domain.Packages;
import com.h1.mycardeepdive.recommendation.domain.*;
import java.util.List;

public class CustomRecommendationFixture {
    private CustomRecommendationFixture() {}

    public static CustomRecommendation createCustomRecommendation(
            long drivingExperienceId, long familyMembersId, long carPurpose, long personalValueId) {
        Options option =
                Options.builder()
                        .id(130L)
                        .imgUrl("img.make-my-car.shop/option/builtincam.jpg")
                        .name("빌트인 캠(보조배터리 포함)")
                        .price(690000)
                        .summary("차량 내부에 카메라를 설치하여 녹화가 가능한 블랙박스")
                        .build();
        RecommendationCarOption recommendationCarOption =
                RecommendationCarOption.builder().option(option).build();
        Packages packages =
                Packages.builder()
                        .id(2L)
                        .name("컴포트 Ⅱ")
                        .optionPackages(
                                List.of(
                                        OptionPackage.builder()
                                                .option(createOptionBuiltInCam())
                                                .build()))
                        .price(690000)
                        .summary("편의성을 위해 구성된 세트 옵션")
                        .build();
        RecommendationCarPackage recommendationCarPackage =
                RecommendationCarPackage.builder().packages(packages).build();
        RecommendationCar recommendationCar =
                RecommendationCar.builder()
                        .recommendationCarOptions(List.of(recommendationCarOption))
                        .recommendationCarPackages(List.of(recommendationCarPackage))
                        .carSpec(createCarSpecD72E())
                        .exteriorColor(createExteriorColor())
                        .interiorColor(createInteriorColor())
                        .build();
        return CustomRecommendation.builder()
                .drivingExperienceId(drivingExperienceId)
                .familyMembersId(familyMembersId)
                .carPurposeId(carPurpose)
                .personalValueId(personalValueId)
                .customRecommendationCars(List.of(createCustomRecommendationCar()))
                .build();
    }
}
