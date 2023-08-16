package com.h1.mycardeepdive.options.domain;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class PackagesTest {
    @DisplayName("패키지 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createPackage() throws Exception {
        // given
        Long id = 1L;
        String name = "name";
        double chooseRate = 5.5;
        long price = 1200000;
        String summary = "summary";

        // when
        Packages _packages =
                Packages.builder()
                        .id(id)
                        .name(name)
                        .chooseRate(chooseRate)
                        .badgeName(Badge.H_GENUINE)
                        .price(price)
                        .summary(summary)
                        .build();

        // then
        assertThat(_packages.getId()).isEqualTo(id);
        assertThat(_packages.getName()).isEqualTo(name);
        assertThat(_packages.getChooseRate()).isEqualTo(chooseRate);
        assertThat(_packages.getBadgeName()).isEqualTo(Badge.H_GENUINE);
        assertThat(_packages.getPrice()).isEqualTo(price);
        assertThat(_packages.getSummary()).isEqualTo(summary);
    }

    @DisplayName("패키지 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void tagEqualsById() {
        // given
        Long id = 1L;

        // when
        Packages aPackages1 = Packages.builder().id(id).name("package1").build();
        Packages aPackages2 = Packages.builder().id(id).name("package2").build();
        Set<Packages> optionSet = new HashSet<>(Arrays.asList(aPackages1, aPackages2));

        // then
        assertThat(aPackages1).isEqualTo(aPackages2);
        assertThat(aPackages1.hashCode()).isEqualTo(aPackages2.hashCode());
        assertThat(optionSet.size()).isEqualTo(1);
    }
}
