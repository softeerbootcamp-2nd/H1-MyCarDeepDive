package com.h1.mycardeepdive.fixture;

import com.h1.mycardeepdive.color.domain.ColorCombination;
import com.h1.mycardeepdive.color.domain.InteriorColor;
import java.util.ArrayList;
import java.util.List;

public class InteriorColorFixture {
    private InteriorColorFixture() {}

    public static InteriorColor createInteriorColor() {
        Long id = 1L;
        String name = "퀼팅천연 (블랙)";
        int price = 100000;
        String imgUrl = "img.make-my-car.shop/icon/black.png";
        String comment = "";
        String interiorImgUrl = "img.make-my-car.shop/car/black.png";
        double chooseRate = 25.0;
        List<ColorCombination> colorCombinations = new ArrayList<>();
        return InteriorColor.builder()
                .id(id)
                .name(name)
                .price(price)
                .imgUrl(imgUrl)
                .interiorImgUrl(interiorImgUrl)
                .chooseRate(chooseRate)
                .comment(comment)
                .colorCombinationList(colorCombinations)
                .build();
    }
}
