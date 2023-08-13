package com.h1.mycardeepdive.tags.domain.repository;

import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.tags.domain.Tags;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
class TagRepositoryTest {
    @Autowired TagRepository tagRepository;

    @BeforeEach
    void setUp() {
        tagRepository.deleteAll();
    }

    @DisplayName("이미 DB에 저장되어 있는 ID를 가진 태그을 저장하면, 해당 ID의 태그는 후에 작성된 태그 정보로 업데이트 된다.")
    @Test
    void saveSameId() {
        // given
        Tags tags1 = Tags.builder().img_url("tag_img1").name("tag_name1").build();
        tagRepository.save(tags1);

        // when
        Tags tags2 = Tags.builder().id(tags1.getId()).img_url("tag_img2").name("tag_name2").build();
        tagRepository.save(tags2);

        // then
        List<Tags> savedTags = tagRepository.findAll();
        assertEquals(savedTags.size(), 1);
        assertEquals(savedTags.get(0).getId(), tags2.getId());
        assertEquals(savedTags.get(0).getName(), tags2.getName());
    }

    @DisplayName("id가 없는 옵션 엔티티를 저장하면 순차적으로 ID를 부여하여 저장한다.")
    @Test
    void saveNoIdTag() {
        // given
        Tags tags1 = Tags.builder().img_url("tag_img1").name("tag_name1").build();
        Tags tags2 = Tags.builder().img_url("tag_img2").name("tag_name2").build();

        // when
        tagRepository.save(tags1);
        tagRepository.save(tags2);

        // then
        long idDiff = tags2.getId() - tags1.getId();
        assertEquals(idDiff, 1L);
    }
}
