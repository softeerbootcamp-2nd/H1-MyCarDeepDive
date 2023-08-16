package com.h1.mycardeepdive.tags.domain;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class TagsTest {
    @DisplayName("태그를 빌더 패턴을 활용하여 생성할 수 있다")
    @Test
    public void createTags() throws Exception {
        // given
        Long id = 1L;
        String name = "tag_name";
        String img_url = "img.jpg";

        // when
        Tags tags = Tags.builder().id(id).name(name).img_url(img_url).build();

        // then
        assertThat(tags.getId()).isEqualTo(id);
        assertThat(tags.getName()).isEqualTo(name);
        assertThat(tags.getImg_url()).isEqualTo(img_url);
    }

    @DisplayName("태그 도메인의 hashCode/equals는 id 값이 같다면 같은 것으로 처리된다.")
    @Test
    void tagEqualsById() {
        // given
        Long id = 1L;

        // when
        Tags tag1 = Tags.builder().id(id).name("artist1").build();
        Tags tag2 = Tags.builder().id(id).name("artist2").build();
        Set<Tags> tagSet = new HashSet<>(Arrays.asList(tag1, tag2));

        // then
        assertThat(tag1).isEqualTo(tag2);
        assertThat(tag1.hashCode()).isEqualTo(tag2.hashCode());
        assertThat(tagSet.size()).isEqualTo(1);
    }
}
