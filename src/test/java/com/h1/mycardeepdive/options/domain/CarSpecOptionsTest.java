package com.h1.mycardeepdive.options.domain;

import com.h1.mycardeepdive.car.domain.CarSpec;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import static com.h1.mycardeepdive.fixture.OptionFixture.createOptionBuiltInCam;
import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;

class CarSpecOptionsTest {
    @DisplayName("CarSpecOption 관계를 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createOptionsPackage() throws Exception {
        // given
        Options options = createOptionBuiltInCam();
        CarSpec carSpec = CarSpec.builder().build();

        // when
        CarSpecOptions carSpecOptions =
                CarSpecOptions.builder()
                        .options(options)
                        .isBasicOption(false)
                        .carSpec(carSpec).build();

        // then
        assertEquals(options, carSpecOptions.getOptions());
        assertEquals(carSpec, carSpecOptions.getCarSpec());
    }

    @DisplayName("CarSpecOption 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void tagEqualsById() {
        // given
        Long id = 1L;

        // when
        CarSpecOptions carSpecOptions1 = CarSpecOptions.builder().id(id).build();
        CarSpecOptions carSpecOptions2 = CarSpecOptions.builder().id(id).build();
        Set<CarSpecOptions> carSpecOptionsSet = new HashSet<>(Arrays.asList(carSpecOptions1, carSpecOptions2));

        // then
        assertThat(carSpecOptions1).isEqualTo(carSpecOptions2);
        assertThat(carSpecOptions1.hashCode()).isEqualTo(carSpecOptions2.hashCode());
        assertThat(carSpecOptionsSet.size()).isEqualTo(1);
    }
}