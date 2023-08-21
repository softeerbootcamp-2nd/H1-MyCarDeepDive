package com.h1.mycardeepdive.color.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

import com.h1.mycardeepdive.color.domain.*;
import com.h1.mycardeepdive.color.domain.repository.TrimExteriorColorRepository;
import com.h1.mycardeepdive.color.domain.repository.TrimInteriorColorRepository;
import com.h1.mycardeepdive.color.ui.dto.ExteriorColorInfo;
import com.h1.mycardeepdive.color.ui.dto.ExteriorColorResponse;
import com.h1.mycardeepdive.color.ui.dto.InteriorColorInfo;
import com.h1.mycardeepdive.color.ui.dto.InteriorColorResponse;
import com.h1.mycardeepdive.trims.domain.Trim;
import java.util.ArrayList;
import java.util.List;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class ColorServiceTest {
    @Mock TrimExteriorColorRepository trimExteriorColorRepository;
    @Mock TrimInteriorColorRepository trimInteriorColorRepository;

    @InjectMocks private ColorService colorService;

    @Test
    @DisplayName("trimId, interiorColorId가 주어졌을 때 가능한 외장색상과 불가능한 외장색상과 다른 트림 색상을 찾을 수 있는 지 확인한다.")
    void findExteriorColors() {
        // given
        Long trimId = 1L;
        Long interiorColorId = 1L;

        Trim trim1 = Trim.builder().id(1L).name("Le Blanc").summary("요약").build();
        Trim trim2 = Trim.builder().id(2L).name("Exclusive").summary("요약").build();

        InteriorColor interiorColor1 =
                InteriorColor.builder()
                        .id(1L)
                        .name("퀼팅천연 (블랙)")
                        .imgUrl("/interior/icon/001.jpg")
                        .interiorImgUrl("/interior/car/001.jpg")
                        .chooseRate(25.0)
                        .price(10000)
                        .comment("")
                        .colorCombinations(null)
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
                        .comment("")
                        .colorCombinations(null)
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
                        .trimsColorCombinations(null)
                        .build();

        ColorCombination colorCombination2 =
                ColorCombination.builder()
                        .id(2L)
                        .exteriorColor(exteriorColor2)
                        .interiorColor(interiorColor2)
                        .build();

        exteriorColor1 =
                ExteriorColor.builder()
                        .id(1L)
                        .name("그라파이트 그레이 메탈릭")
                        .imgUrl("/exterior/icon/001.jpg")
                        .exteriorImgUrl("/exterior/car/001.jpg")
                        .chooseRate(25.0)
                        .price(10000)
                        .comment("")
                        .colorCombinations(List.of(colorCombination1))
                        .build();

        exteriorColor2 =
                ExteriorColor.builder()
                        .id(2L)
                        .name("블랙")
                        .imgUrl("/exterior/icon/002.jpg")
                        .exteriorImgUrl("/exterior/car/002.jpg")
                        .chooseRate(25.0)
                        .colorCombinations(List.of(colorCombination2))
                        .build();

        TrimExteriorColor trimExteriorColor1 =
                TrimExteriorColor.builder()
                        .id(1L)
                        .trim(trim1)
                        .exteriorColor(exteriorColor1)
                        .build();

        TrimExteriorColor trimExteriorColor2 =
                TrimExteriorColor.builder()
                        .id(2L)
                        .trim(trim2)
                        .exteriorColor(exteriorColor2)
                        .build();

        exteriorColor1 =
                ExteriorColor.builder()
                        .id(1L)
                        .name("그라파이트 그레이 메탈릭")
                        .imgUrl("/exterior/icon/001.jpg")
                        .exteriorImgUrl("/exterior/car/001.jpg")
                        .chooseRate(25.0)
                        .price(10000)
                        .comment("")
                        .colorCombinations(List.of(colorCombination1))
                        .trimExteriorColors(List.of(trimExteriorColor1))
                        .build();

        exteriorColor2 =
                ExteriorColor.builder()
                        .id(2L)
                        .name("블랙")
                        .imgUrl("/exterior/icon/002.jpg")
                        .exteriorImgUrl("/exterior/car/002.jpg")
                        .chooseRate(25.0)
                        .colorCombinations(List.of(colorCombination2))
                        .trimExteriorColors(List.of(trimExteriorColor2))
                        .build();

        when(trimExteriorColorRepository.findAllExteriorColors())
                .thenReturn(new ArrayList<>(List.of(exteriorColor1, exteriorColor2)));

        when(trimExteriorColorRepository.findByTrimId(trimId))
                .thenReturn(List.of(trimExteriorColor1));

        // when
        ExteriorColorResponse colorResponse =
                colorService.findExteriorColors(trimId, interiorColorId);
        ExteriorColorInfo availableColor = colorResponse.getAvailable_colors().get(1L);
        ExteriorColorInfo otherTrimColor = colorResponse.getOther_trim_colors().get(2L);

        // then
        assertThat(availableColor.getName()).isEqualTo(exteriorColor1.getName());
        assertThat(availableColor.getImg_url()).isEqualTo(exteriorColor1.getImgUrl());
        assertThat(availableColor.getChoose_rate()).isEqualTo(exteriorColor1.getChooseRate());

        assertThat(otherTrimColor.getName()).isEqualTo(exteriorColor2.getName());
        assertThat(otherTrimColor.getImg_url()).isEqualTo(exteriorColor2.getImgUrl());
        assertThat(otherTrimColor.getChoose_rate()).isEqualTo(exteriorColor2.getChooseRate());
    }

    @Test
    @DisplayName("trimId, exteriorColorId가 주어졌을 때 가능한 내장색상과 불가능한 내장색상을 찾을 수 있는 지 확인한다.")
    void findInteriorColors() {
        // given
        Long trimId = 1L;
        Long exteriorColorId = 1L;

        Trim trim1 = Trim.builder().id(1L).name("Le Blanc").summary("요약").build();
        Trim trim2 = Trim.builder().id(2L).name("Exclusive").summary("요약").build();

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

        interiorColor1 =
                InteriorColor.builder()
                        .id(1L)
                        .name("퀼팅천연 (블랙)")
                        .imgUrl("/interior/icon/001.jpg")
                        .interiorImgUrl("/interior/car/001.jpg")
                        .chooseRate(25.0)
                        .colorCombinations(List.of(colorCombination1))
                        .build();

        interiorColor2 =
                InteriorColor.builder()
                        .id(2L)
                        .name("퀼팅천연 (블랙)")
                        .imgUrl("/interior/icon/001.jpg")
                        .interiorImgUrl("/interior/car/001.jpg")
                        .chooseRate(25.0)
                        .colorCombinations(List.of(colorCombination2))
                        .build();

        TrimInteriorColor trimInteriorColor1 =
                TrimInteriorColor.builder()
                        .id(1L)
                        .trim(trim1)
                        .interiorColor(interiorColor1)
                        .build();

        TrimInteriorColor trimInteriorColor2 =
                TrimInteriorColor.builder()
                        .id(2L)
                        .trim(trim2)
                        .interiorColor(interiorColor2)
                        .build();

        interiorColor1 =
                InteriorColor.builder()
                        .id(1L)
                        .name("퀼팅천연 (블랙)")
                        .imgUrl("/interior/icon/001.jpg")
                        .interiorImgUrl("/interior/car/001.jpg")
                        .chooseRate(25.0)
                        .colorCombinations(List.of(colorCombination1))
                        .trimInteriorColors(List.of(trimInteriorColor1))
                        .build();

        interiorColor2 =
                InteriorColor.builder()
                        .id(2L)
                        .name("퀼팅천연 (블랙)")
                        .imgUrl("/interior/icon/001.jpg")
                        .interiorImgUrl("/interior/car/001.jpg")
                        .chooseRate(25.0)
                        .colorCombinations(List.of(colorCombination2))
                        .trimInteriorColors(List.of(trimInteriorColor2))
                        .build();

        when(trimInteriorColorRepository.findAllInteriorColors())
                .thenReturn(new ArrayList<>(List.of(interiorColor1, interiorColor2)));

        when(trimInteriorColorRepository.findByTrimId(trimId))
                .thenReturn(List.of(trimInteriorColor1));

        // when
        InteriorColorResponse colorResponse =
                colorService.findInteriorColors(trimId, exteriorColorId);
        InteriorColorInfo availableColor = colorResponse.getAvailable_colors().get(1L);
        InteriorColorInfo otherTrimColor = colorResponse.getOther_trim_colors().get(2L);

        // then
        assertThat(availableColor.getName()).isEqualTo(interiorColor1.getName());
        assertThat(availableColor.getImg_url()).isEqualTo(interiorColor1.getImgUrl());
        assertThat(availableColor.getCar_img_url()).isEqualTo(interiorColor1.getInteriorImgUrl());
        assertThat(availableColor.getChoose_rate()).isEqualTo(interiorColor1.getChooseRate());

        assertThat(otherTrimColor.getName()).isEqualTo(interiorColor2.getName());
        assertThat(otherTrimColor.getImg_url()).isEqualTo(interiorColor2.getImgUrl());
        assertThat(otherTrimColor.getCar_img_url()).isEqualTo(interiorColor2.getInteriorImgUrl());
        assertThat(otherTrimColor.getChoose_rate()).isEqualTo(interiorColor2.getChooseRate());
    }
}
