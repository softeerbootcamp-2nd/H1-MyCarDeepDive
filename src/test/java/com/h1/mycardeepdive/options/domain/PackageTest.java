package com.h1.mycardeepdive.options.domain;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class PackageTest {
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
        Package _package =
                Package.builder()
                        .id(id)
                        .name(name)
                        .chooseRate(chooseRate)
                        .badgeName(Badge.H_GENUINE)
                        .price(price)
                        .summary(summary)
                        .build();

        // then
        assertThat(_package.getId()).isEqualTo(id);
        assertThat(_package.getName()).isEqualTo(name);
        assertThat(_package.getChooseRate()).isEqualTo(chooseRate);
        assertThat(_package.getBadgeName()).isEqualTo(Badge.H_GENUINE);
        assertThat(_package.getPrice()).isEqualTo(price);
        assertThat(_package.getSummary()).isEqualTo(summary);
    }

    @DisplayName("패키지 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void tagEqualsById() {
        // given
        Long id = 1L;

        // when
        Package aPackage1 = Package.builder().id(id).name("package1").build();
        Package aPackage2 = Package.builder().id(id).name("package2").build();
        Set<Package> optionSet = new HashSet<>(Arrays.asList(aPackage1, aPackage2));

        // then
        assertThat(aPackage1).isEqualTo(aPackage2);
        assertThat(aPackage1.hashCode()).isEqualTo(aPackage2.hashCode());
        assertThat(optionSet.size()).isEqualTo(1);
    }
}
