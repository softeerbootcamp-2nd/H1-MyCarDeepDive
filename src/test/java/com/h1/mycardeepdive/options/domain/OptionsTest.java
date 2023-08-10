package com.h1.mycardeepdive.options.domain;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class OptionsTest {
    @DisplayName("옵션을 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createOptions() throws Exception {
        // given
        Long id = 1L;
        String name = "tag_name";
        String imgUrl = "img.jpg";
        double chooseRate = 5.5;
        boolean isBasicOption = false;
        String description = "tag description";
        long price = 100000;
        String summary = "tag summary";

        // when
        Options options =
                Options.builder()
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

        // then
        assertThat(options.getId()).isEqualTo(id);
        assertThat(options.getName()).isEqualTo(name);
        assertThat(options.getImgUrl()).isEqualTo(imgUrl);
        assertThat(options.getChooseRate()).isEqualTo(chooseRate);
        assertThat(options.isBasicOption()).isEqualTo(isBasicOption);
        assertThat(options.getBadgeName()).isEqualTo(Badge.H_GENUINE);
        assertThat(options.getDescription()).isEqualTo(description);
        assertThat(options.getPrice()).isEqualTo(price);
        assertThat(options.getSummary()).isEqualTo(summary);
    }

    @DisplayName("옵션 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void tagEqualsById() {
        // given
        Long id = 1L;

        // when
        Options options1 = Options.builder().id(id).name("option1").build();
        Options options2 = Options.builder().id(id).name("option2").build();
        Set<Options> optionSet = new HashSet<>(Arrays.asList(options1, options2));

        // then
        assertThat(options1).isEqualTo(options2);
        assertThat(options1.hashCode()).isEqualTo(options2.hashCode());
        assertThat(optionSet.size()).isEqualTo(1);
    }
}
