package com.h1.mycardeepdive.car.domain;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class BodyTest {

    @DisplayName("바디를 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createBody() throws Exception {
        // given
        Long id = 1L;
        String name = "name";
        String description = "description";
        String imgUrl = "img.jpg";

        // when
        Body body =
                Body.builder().id(id).name(name).description(description).imgUrl(imgUrl).build();

        // then
        assertThat(body.getId()).isEqualTo(id);
        assertThat(body.getName()).isEqualTo(name);
        assertThat(body.getImgUrl()).isEqualTo(imgUrl);
        assertThat(body.getDescription()).isEqualTo(description);
    }

    @DisplayName("바디 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void bodyEqualsById() {
        // given
        Long id = 1L;

        // when
        Body body1 = Body.builder().id(id).name("body1").build();
        Body body2 = Body.builder().id(id).name("body2").build();
        Set<Body> bodySet = new HashSet<>(Arrays.asList(body1, body2));

        // then
        assertThat(body1).isEqualTo(body2);
        assertThat(body1.hashCode()).isEqualTo(body2.hashCode());
        assertThat(bodySet.size()).isEqualTo(1);
    }
}
