package com.h1.mycardeepdive.options.domain;

import static com.h1.mycardeepdive.fixture.PackageFixture.createPackageComfortII;
import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.car.domain.CarSpec;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class CarSpecPackageTest {
    @DisplayName("CarSpecPackage 관계를 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createCarSpecPackage() throws Exception {
        // given
        Package _package = createPackageComfortII();
        CarSpec carSpec = CarSpec.builder().build();

        // when
        CarSpecPackage carSpecPackage =
                CarSpecPackage.builder()._package(_package).carSpec(carSpec).build();

        // then
        assertEquals(_package, carSpecPackage.get_package());
        assertEquals(carSpec, carSpecPackage.getCarSpec());
    }

    @DisplayName("CarSpecPackage 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void tagEqualsById() {
        // given
        Long id = 1L;

        // when
        CarSpecPackage carSpecPackage1 = CarSpecPackage.builder().id(id).build();
        CarSpecPackage carSpecPackage2 = CarSpecPackage.builder().id(id).build();
        Set<CarSpecPackage> carSpecPackagesSet =
                new HashSet<>(Arrays.asList(carSpecPackage1, carSpecPackage2));

        // then
        assertThat(carSpecPackage1).isEqualTo(carSpecPackage2);
        assertThat(carSpecPackage1.hashCode()).isEqualTo(carSpecPackage2.hashCode());
        assertThat(carSpecPackagesSet.size()).isEqualTo(1);
    }
}
