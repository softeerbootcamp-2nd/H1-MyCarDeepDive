package com.h1.mycardeepdive.fixture;

import com.h1.mycardeepdive.color.domain.ColorCombination;
import com.h1.mycardeepdive.color.domain.ExteriorColor;
import java.util.ArrayList;
import java.util.List;

public class ExteriorColorFixture {
    private ExteriorColorFixture() {}

    public static ExteriorColor createExteriorColor() {
        Long id = 1L;
        String name = "어비스 블랙 펄";
        int price = 100000;
        String imgUrl = "img.make-my-car.shop/icon/black.png";
        String comment = "";
        String exteriorImgUrl = "img.make-my-car.shop/car/black";
        double chooseRate = 25.0;
        List<ColorCombination> colorCombinations = new ArrayList<>();
        return ExteriorColor.builder()
                .id(id)
                .name(name)
                .price(price)
                .imgUrl(imgUrl)
                .exteriorImgUrl(exteriorImgUrl)
                .chooseRate(chooseRate)
                .comment("")
                .colorCombinations(colorCombinations)
                .build();
    }
}
