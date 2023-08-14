package com.h1.mycardeepdive.options.domain;

import static com.h1.mycardeepdive.fixture.OptionFixture.createOptionBuiltInCam;
import static com.h1.mycardeepdive.fixture.PackageFixture.createPackageComfortII;
import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class OptionPackagesTest {

    @DisplayName("옵션패키지 관계를 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createOptionsPackage() throws Exception {
        // given
        Options options = createOptionBuiltInCam();
        Packages _packages = createPackageComfortII();

        // when
        OptionPackage optionPackage =
                OptionPackage.builder().option(options).packages(_packages).build();

        // then
        assertEquals(options, optionPackage.getOption());
        assertEquals(_packages, optionPackage.getPackages());
    }

    @DisplayName("옵션패키지 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void tagEqualsById() {
        // given
        Long id = 1L;

        // when
        OptionPackage optionPackage1 = OptionPackage.builder().id(id).build();
        OptionPackage optionPackage2 = OptionPackage.builder().id(id).build();
        Set<OptionPackage> optionSet = new HashSet<>(Arrays.asList(optionPackage1, optionPackage2));

        // then
        assertThat(optionPackage1).isEqualTo(optionPackage2);
        assertThat(optionPackage1.hashCode()).isEqualTo(optionPackage2.hashCode());
        assertThat(optionSet.size()).isEqualTo(1);
    }
}
