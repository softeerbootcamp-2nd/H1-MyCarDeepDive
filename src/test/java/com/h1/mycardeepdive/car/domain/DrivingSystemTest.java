package com.h1.mycardeepdive.car.domain;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class DrivingSystemTest {

    @DisplayName("구동 방식을 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createDrivingSystem() throws Exception {
        // given
        Long id = 1L;
        String name = "name";
        String description = "description";
        String imgUrl = "img.jpg";

        // when
        DrivingSystem drivingSystem =
                DrivingSystem.builder()
                        .id(id)
                        .name(name)
                        .description(description)
                        .imgUrl(imgUrl)
                        .build();

        // then
        assertThat(drivingSystem.getId()).isEqualTo(id);
        assertThat(drivingSystem.getName()).isEqualTo(name);
        assertThat(drivingSystem.getImgUrl()).isEqualTo(imgUrl);
        assertThat(drivingSystem.getDescription()).isEqualTo(description);
    }

    @DisplayName("구동 방식 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void drivingSystemEqualsById() {
        // given
        Long id = 1L;

        // when
        DrivingSystem drivingSystem1 =
                DrivingSystem.builder().id(id).name("drivingSystem1").build();
        DrivingSystem drivingSystem2 =
                DrivingSystem.builder().id(id).name("drivingSystem2").build();
        Set<DrivingSystem> drivingSystemSet =
                new HashSet<>(Arrays.asList(drivingSystem1, drivingSystem2));

        // then
        assertThat(drivingSystem1).isEqualTo(drivingSystem2);
        assertThat(drivingSystem1.hashCode()).isEqualTo(drivingSystem2.hashCode());
        assertThat(drivingSystemSet.size()).isEqualTo(1);
    }
}
