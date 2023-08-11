package com.h1.mycardeepdive.car.domain;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class CarSpecTest {

    @DisplayName("차량 사양을 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createCarSpecs() throws Exception {
        // given
        Long id = 1L;

        // when
        CarSpec carSpec = CarSpec.builder().id(id).build();

        // then
        assertThat(carSpec.getId()).isEqualTo(id);
    }

    @DisplayName("차사양 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void tagEqualsById() {
        // given
        Long id = 1L;

        // when
        CarSpec carSpec1 = CarSpec.builder().id(id).build();
        CarSpec carSpec2 = CarSpec.builder().id(id).build();
        Set<CarSpec> optionSet = new HashSet<>(Arrays.asList(carSpec1, carSpec2));

        // then
        assertThat(carSpec1).isEqualTo(carSpec2);
        assertThat(carSpec1.hashCode()).isEqualTo(carSpec2.hashCode());
        assertThat(optionSet.size()).isEqualTo(1);
    }
}
