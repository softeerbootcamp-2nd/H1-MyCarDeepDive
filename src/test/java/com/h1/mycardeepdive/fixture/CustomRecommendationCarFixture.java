package com.h1.mycardeepdive.fixture;

import static com.h1.mycardeepdive.fixture.CarSpecFixture.createCarSpecD72E;
import static com.h1.mycardeepdive.fixture.ExteriorColorFixture.createExteriorColor;
import static com.h1.mycardeepdive.fixture.InteriorColorFixture.createInteriorColor;
import static com.h1.mycardeepdive.fixture.OptionFixture.createOptionBuiltInCam;

import com.h1.mycardeepdive.options.domain.OptionPackage;
import com.h1.mycardeepdive.options.domain.Options;
import com.h1.mycardeepdive.options.domain.Packages;
import com.h1.mycardeepdive.recommendation.domain.CustomRecommendationCar;
import com.h1.mycardeepdive.recommendation.domain.RecommendationCar;
import com.h1.mycardeepdive.recommendation.domain.RecommendationCarOption;
import com.h1.mycardeepdive.recommendation.domain.RecommendationCarPackage;
import java.util.List;

public class CustomRecommendationCarFixture {
    public static CustomRecommendationCar createCustomRecommendationCar() {
        return new CustomRecommendationCar(
                1L,
                null,
                RecommendationCar.builder()
                        .recommendationCarOptions(
                                List.of(
                                        RecommendationCarOption.builder()
                                                .option(
                                                        Options.builder()
                                                                .id(130L)
                                                                .imgUrl(
                                                                        "img.make-my-car.shop/option/builtincam.jpg")
                                                                .name("빌트인 캠(보조배터리 포함)")
                                                                .price(690000)
                                                                .summary(
                                                                        "차량 내부에 카메라를 설치하여 녹화가 가능한 블랙박스")
                                                                .build())
                                                .build()))
                        .recommendationCarPackages(
                                List.of(
                                        RecommendationCarPackage.builder()
                                                .packages(
                                                        Packages.builder()
                                                                .id(2L)
                                                                .name("컴포트 Ⅱ")
                                                                .optionPackages(
                                                                        List.of(
                                                                                OptionPackage
                                                                                        .builder()
                                                                                        .option(
                                                                                                createOptionBuiltInCam())
                                                                                        .build()))
                                                                .price(690000)
                                                                .summary("편의성을 위해 구성된 세트 옵션")
                                                                .build())
                                                .build()))
                        .carSpec(createCarSpecD72E())
                        .exteriorColor(createExteriorColor())
                        .interiorColor(createInteriorColor())
                        .build());
    }
}
