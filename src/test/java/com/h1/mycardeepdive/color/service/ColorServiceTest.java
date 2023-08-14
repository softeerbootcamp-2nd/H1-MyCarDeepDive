package com.h1.mycardeepdive.color.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

import com.h1.mycardeepdive.color.domain.ColorCombination;
import com.h1.mycardeepdive.color.domain.ExteriorColor;
import com.h1.mycardeepdive.color.domain.InteriorColor;
import com.h1.mycardeepdive.color.domain.TrimsColorCombination;
import com.h1.mycardeepdive.color.domain.repository.TrimsColorCombinationRepository;
import com.h1.mycardeepdive.color.ui.dto.ColorInfo;
import com.h1.mycardeepdive.color.ui.dto.ColorResponse;
import com.h1.mycardeepdive.trims.domain.Trims;
import java.util.List;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class ColorServiceTest {
    @Mock private TrimsColorCombinationRepository trimsColorCombinationRepository;

    @InjectMocks private ColorService colorService;

    @Test
    @DisplayName("trimId, interiorColorId가 주어졌을 때 가능한 외장색상과 불가능한 외장색상을 찾을 수 있는 지 확인한다.")
    void findExteriorColors() {
        // given
        Long trimId = 1L;
        Long interiorColorId = 1L;

        Trims trims = Trims.builder().id(1L).name("Le Blanc").summary("요약").build();

        InteriorColor interiorColor1 =
                InteriorColor.builder()
                        .id(1L)
                        .name("퀼팅천연 (블랙)")
                        .imgUrl("/interior/icon/001.jpg")
                        .interiorImgUrl("/interior/car/001.jpg")
                        .chooseRate(25.0)
                        .price(10000)
                        .build();

        InteriorColor interiorColor2 =
                InteriorColor.builder()
                        .id(2L)
                        .name("퀼팅천연 (블랙)")
                        .imgUrl("/interior/icon/001.jpg")
                        .interiorImgUrl("/interior/car/001.jpg")
                        .chooseRate(25.0)
                        .build();

        ExteriorColor exteriorColor1 =
                ExteriorColor.builder()
                        .id(1L)
                        .name("그라파이트 그레이 메탈릭")
                        .imgUrl("/exterior/icon/001.jpg")
                        .exteriorImgUrl("/exterior/car/001.jpg")
                        .chooseRate(25.0)
                        .price(10000)
                        .build();

        ExteriorColor exteriorColor2 =
                ExteriorColor.builder()
                        .id(2L)
                        .name("블랙")
                        .imgUrl("/exterior/icon/002.jpg")
                        .exteriorImgUrl("/exterior/car/002.jpg")
                        .chooseRate(25.0)
                        .build();

        ColorCombination colorCombination1 =
                ColorCombination.builder()
                        .id(1L)
                        .exteriorColor(exteriorColor1)
                        .interiorColor(interiorColor1)
                        .build();

        ColorCombination colorCombination2 =
                ColorCombination.builder()
                        .id(2L)
                        .exteriorColor(exteriorColor2)
                        .interiorColor(interiorColor2)
                        .build();

        TrimsColorCombination trimsColorCombination1 =
                TrimsColorCombination.builder()
                        .id(1L)
                        .trims(trims)
                        .colorCombination(colorCombination1)
                        .build();

        TrimsColorCombination trimsColorCombination2 =
                TrimsColorCombination.builder()
                        .id(2L)
                        .trims(trims)
                        .colorCombination(colorCombination2)
                        .build();

        when(trimsColorCombinationRepository.findByTrims_Id(trimId))
                .thenReturn(List.of(trimsColorCombination1, trimsColorCombination2));
        // when
        ColorResponse colorResponse = colorService.findExteriorColors(trimId, interiorColorId);
        ColorInfo availableColor = colorResponse.getAvailable_colors().get(0);
        ColorInfo unavailableColor = colorResponse.getUnavailable_colors().get(0);

        // then
        assertThat(availableColor.getName()).isEqualTo(exteriorColor1.getName());
        assertThat(availableColor.getImg_url()).isEqualTo(exteriorColor1.getImgUrl());
        assertThat(availableColor.getCar_img_url()).isEqualTo(exteriorColor1.getExteriorImgUrl());
        assertThat(availableColor.getChoose_rate()).isEqualTo(exteriorColor1.getChooseRate());

        assertThat(unavailableColor.getName()).isEqualTo(exteriorColor2.getName());
        assertThat(unavailableColor.getImg_url()).isEqualTo(exteriorColor2.getImgUrl());
        assertThat(unavailableColor.getCar_img_url()).isEqualTo(exteriorColor2.getExteriorImgUrl());
        assertThat(unavailableColor.getChoose_rate()).isEqualTo(exteriorColor2.getChooseRate());
    }

    @Test
    @DisplayName("trimId, exteriorColorId가 주어졌을 때 가능한 내장색상과 불가능한 내장색상을 찾을 수 있는 지 확인한다.")
    void findInteriorColors() {
        // given
        Long trimId = 1L;
        Long exteriorColorId = 1L;

        Trims trims = Trims.builder().id(1L).name("Le Blanc").summary("요약").build();

        InteriorColor interiorColor1 =
                InteriorColor.builder()
                        .id(1L)
                        .name("퀼팅천연 (블랙)")
                        .imgUrl("/interior/icon/001.jpg")
                        .interiorImgUrl("/interior/car/001.jpg")
                        .chooseRate(25.0)
                        .build();

        InteriorColor interiorColor2 =
                InteriorColor.builder()
                        .id(2L)
                        .name("퀼팅천연 (블랙)")
                        .imgUrl("/interior/icon/001.jpg")
                        .interiorImgUrl("/interior/car/001.jpg")
                        .chooseRate(25.0)
                        .build();

        ExteriorColor exteriorColor1 =
                ExteriorColor.builder()
                        .id(1L)
                        .name("그라파이트 그레이 메탈릭")
                        .imgUrl("/exterior/icon/001.jpg")
                        .exteriorImgUrl("/exterior/car/001.jpg")
                        .chooseRate(25.0)
                        .build();

        ExteriorColor exteriorColor2 =
                ExteriorColor.builder()
                        .id(2L)
                        .name("블랙")
                        .imgUrl("/exterior/icon/002.jpg")
                        .exteriorImgUrl("/exterior/car/002.jpg")
                        .chooseRate(25.0)
                        .build();

        ColorCombination colorCombination1 =
                ColorCombination.builder()
                        .id(1L)
                        .exteriorColor(exteriorColor1)
                        .interiorColor(interiorColor1)
                        .build();

        ColorCombination colorCombination2 =
                ColorCombination.builder()
                        .id(2L)
                        .exteriorColor(exteriorColor2)
                        .interiorColor(interiorColor2)
                        .build();

        TrimsColorCombination trimsColorCombination1 =
                TrimsColorCombination.builder()
                        .id(1L)
                        .trims(trims)
                        .colorCombination(colorCombination1)
                        .build();

        TrimsColorCombination trimsColorCombination2 =
                TrimsColorCombination.builder()
                        .id(2L)
                        .trims(trims)
                        .colorCombination(colorCombination2)
                        .build();

        when(trimsColorCombinationRepository.findByTrims_Id(trimId))
                .thenReturn(List.of(trimsColorCombination1, trimsColorCombination2));
        // when
        ColorResponse colorResponse = colorService.findInteriorColors(trimId, exteriorColorId);
        ColorInfo availableColor = colorResponse.getAvailable_colors().get(0);
        ColorInfo unavailableColor = colorResponse.getUnavailable_colors().get(0);

        // then
        assertThat(availableColor.getName()).isEqualTo(interiorColor1.getName());
        assertThat(availableColor.getImg_url()).isEqualTo(interiorColor1.getImgUrl());
        assertThat(availableColor.getCar_img_url()).isEqualTo(interiorColor1.getInteriorImgUrl());
        assertThat(availableColor.getChoose_rate()).isEqualTo(interiorColor1.getChooseRate());

        assertThat(unavailableColor.getName()).isEqualTo(interiorColor2.getName());
        assertThat(unavailableColor.getImg_url()).isEqualTo(interiorColor2.getImgUrl());
        assertThat(unavailableColor.getCar_img_url()).isEqualTo(interiorColor2.getInteriorImgUrl());
        assertThat(unavailableColor.getChoose_rate()).isEqualTo(interiorColor2.getChooseRate());
    }
}
