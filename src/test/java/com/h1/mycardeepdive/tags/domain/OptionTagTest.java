package com.h1.mycardeepdive.tags.domain;

import static com.h1.mycardeepdive.fixture.OptionFixture.createOptionBuiltInCam;
import static com.h1.mycardeepdive.fixture.TagsFixture.createSafetyTag;
import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.options.domain.Options;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class OptionTagTest {
    @DisplayName("옵션태그 관계를 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createOptionsTag() throws Exception {
        // given
        Options options = createOptionBuiltInCam();
        Tags tag = createSafetyTag();

        // when
        OptionTag optionTag =
                OptionTag.builder()
                        .option(options)
                        .tag(tag)
                        .position_x(12.1)
                        .position_y(11.1)
                        .build();

        // then
        assertEquals(options, optionTag.getOption());
        assertEquals(tag, optionTag.getTag());
    }

    @DisplayName("옵션태그 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void tagEqualsById() {
        // given
        Long id = 1L;

        // when
        OptionTag optionTag1 = OptionTag.builder().id(id).build();
        OptionTag optionTag2 = OptionTag.builder().id(id).build();
        Set<OptionTag> optionSet = new HashSet<>(Arrays.asList(optionTag1, optionTag2));

        // then
        assertThat(optionTag1).isEqualTo(optionTag2);
        assertThat(optionTag2.hashCode()).isEqualTo(optionTag2.hashCode());
        assertThat(optionSet.size()).isEqualTo(1);
    }
}
