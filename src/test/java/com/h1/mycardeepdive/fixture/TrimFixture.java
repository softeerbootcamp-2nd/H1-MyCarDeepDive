package com.h1.mycardeepdive.fixture;

import static com.h1.mycardeepdive.fixture.ExteriorColorFixture.createExteriorColor;
import static com.h1.mycardeepdive.fixture.InteriorColorFixture.createInteriorColor;

import com.h1.mycardeepdive.color.domain.ExteriorColor;
import com.h1.mycardeepdive.color.domain.InteriorColor;
import com.h1.mycardeepdive.color.domain.TrimExteriorColor;
import com.h1.mycardeepdive.color.domain.TrimInteriorColor;
import com.h1.mycardeepdive.trims.domain.Trim;
import java.util.List;

public class TrimFixture {
    private TrimFixture() {}

    public static Trim createExclusiveTrim() {
        Long id = 1L;
        String name = "Exclusive";
        String imgUrl = "img.make-my-car.shop/trim/exclusive.png";
        String wheelName = "기본 휠";
        double wheelSize = 18;
        String seatName = "인조/천연가죽 시트";
        double navigationSize = 12.3;
        double clusterSize = 4.2;
        String summary = "합리적인 당신을 위한";
        ExteriorColor exteriorColor = createExteriorColor();
        InteriorColor interiorColor = createInteriorColor();
        TrimExteriorColor trimExteriorColor =
                TrimExteriorColor.builder().exteriorColor(exteriorColor).build();
        TrimInteriorColor trimInteriorColor =
                TrimInteriorColor.builder().interiorColor(interiorColor).build();
        List<TrimExteriorColor> trimExteriorColors = List.of(trimExteriorColor);
        List<TrimInteriorColor> trimInteriorColors = List.of(trimInteriorColor);

        return Trim.builder()
                .id(id)
                .name(name)
                .imgUrl(imgUrl)
                .wheelName(wheelName)
                .wheelSize(wheelSize)
                .seatName(seatName)
                .navigationSize(navigationSize)
                .clusterSize(clusterSize)
                .summary(summary)
                .trimExteriorColors(trimExteriorColors)
                .trimInteriorColors(trimInteriorColors)
                .build();
    }
}
