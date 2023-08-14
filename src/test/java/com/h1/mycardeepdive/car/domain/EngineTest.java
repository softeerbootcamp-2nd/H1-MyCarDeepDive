package com.h1.mycardeepdive.car.domain;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class EngineTest {

    @DisplayName("엔진을 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createEngine() throws Exception {
        // given
        Long id = 1L;
        String name = "name";
        String description = "description";
        String imgUrl = "img.jpg";
        String maxPower = "100";
        String maxTorque = "100";

        // when
        Engine engine =
                Engine.builder()
                        .id(id)
                        .name(name)
                        .description(description)
                        .imgUrl(imgUrl)
                        .maxPower(maxPower)
                        .maxTorque(maxTorque)
                        .build();

        // then
        assertThat(engine.getId()).isEqualTo(id);
        assertThat(engine.getName()).isEqualTo(name);
        assertThat(engine.getImgUrl()).isEqualTo(imgUrl);
        assertThat(engine.getDescription()).isEqualTo(description);
        assertThat(engine.getMaxPower()).isEqualTo(maxPower);
        assertThat(engine.getMaxTorque()).isEqualTo(maxTorque);
    }

    @DisplayName("엔진 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void engineEqualsById() {
        // given
        Long id = 1L;

        // when
        Engine engine1 = Engine.builder().id(id).name("engine1").build();
        Engine engine2 = Engine.builder().id(id).name("engine2").build();
        Set<Engine> engineSet = new HashSet<>(Arrays.asList(engine1, engine2));

        // then
        assertThat(engine1).isEqualTo(engine2);
        assertThat(engine1.hashCode()).isEqualTo(engine2.hashCode());
        assertThat(engineSet.size()).isEqualTo(1);
    }
}
