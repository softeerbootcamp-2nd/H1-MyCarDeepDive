package com.h1.mycardeepdive.tags.domain;

import static com.h1.mycardeepdive.fixture.PackageFixture.createPackageComfortII;
import static com.h1.mycardeepdive.fixture.TagsFixture.createSafetyTag;
import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.options.domain.Packages;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class PackagesTagTest {
    @DisplayName("패키지태그 관계를 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createPackageTag() throws Exception {
        // given
        Packages aPackages = createPackageComfortII();
        Tags tags = createSafetyTag();

        // when
        PackageTag packageTag = PackageTag.builder().packages(aPackages).tag(tags).build();

        // then
        assertEquals(aPackages, packageTag.getPackages());
        assertEquals(tags, packageTag.getTag());
    }

    @DisplayName("패키지태그 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void tagEqualsById() {
        // given
        Long id = 1L;

        // when
        PackageTag packageTag1 = PackageTag.builder().id(id).build();
        PackageTag packageTag2 = PackageTag.builder().id(id).build();
        Set<PackageTag> optionSet = new HashSet<>(Arrays.asList(packageTag1, packageTag2));

        // then
        assertThat(packageTag1).isEqualTo(packageTag2);
        assertThat(packageTag1.hashCode()).isEqualTo(packageTag2.hashCode());
        assertThat(optionSet.size()).isEqualTo(1);
    }
}
