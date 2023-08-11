package com.h1.mycardeepdive.fixture;

import com.h1.mycardeepdive.options.domain.Badge;
import com.h1.mycardeepdive.options.domain.Options;

public class OptionFixture {
    private OptionFixture() {}

    public static Options createOptionBuiltInCam() {
        Long id = 0L;
        String name = "빌트인 캠(보조배터리 포함)";
        String imgUrl = "https://img.etnews.com/photonews/2011/1352481_20201113164311_199_0001.jpg";
        double chooseRate = 5.5;
        boolean isBasicOption = false;
        String description =
                "빌트인 적용된 영상기록장치로, 내비게이션 화면을 통해 영상 확인 및 앱 연동을 통해 영상 확인 및 SNS 공유가 가능합니다.";
        long price = 1090000;
        String summary = "차량 내부에 카메라를 설치하여 녹화가 가능한 블랙박스";

        return Options.builder()
                .id(id)
                .name(name)
                .imgUrl(imgUrl)
                .chooseRate(chooseRate)
                .isBasicOption(isBasicOption)
                .badgeName(Badge.H_GENUINE)
                .description(description)
                .price(price)
                .summary(summary)
                .build();
    }

    public static Options createOptionStopSystem() {
        Long id = 1L;
        String name = "다중 충돌방지 자동 제동 시스템";
        String imgUrl =
                "https://www.hyundai.co.kr/image/upload/asset_library/MDA00000000000000388/e435f2e0b5f246ccaa8ce260dac16c9b.jpg";
        double chooseRate = 100;
        boolean isBasicOption = true;
        String description =
                "차량의 정면 또는 측면 충돌사고로 에어백 전개 시 차량에 적절한 자동 긴급 제동을 통해 2차 사고 및 다중 충돌을 경감시켜줍니다.";
        long price = 0;
        String summary = null;

        return Options.builder()
                .id(id)
                .name(name)
                .imgUrl(imgUrl)
                .chooseRate(chooseRate)
                .isBasicOption(isBasicOption)
                .badgeName(null)
                .description(description)
                .price(price)
                .summary(summary)
                .build();
    }
}
