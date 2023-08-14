package com.h1.mycardeepdive.options.domain.repository;

import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.options.domain.Options;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
class OptionsRepositoryTest {
    @Autowired OptionsRepository optionsRepository;

    @BeforeEach
    void setUp() {
        optionsRepository.deleteAll();
    }

    @DisplayName("이미 DB에 저장되어 있는 ID를 가진 옵션을 저장하면, 해당 ID의 옵션은 후에 작성된 옵션 정보로 업데이트 된다.")
    @Test
    void saveSameId() {
        // given
        Options option1 = Options.builder().name("옵션1").build();
        optionsRepository.save(option1);

        // when
        Options option2 = Options.builder().id(option1.getId()).name("옵션2").build();
        optionsRepository.save(option2);

        // then
        List<Options> savedOptions = optionsRepository.findAll();
        assertEquals(savedOptions.size(), 1);
    }

    @DisplayName("id가 없는 옵션 엔티티를 저장하면 순차적으로 ID를 부여하여 저장한다.")
    @Test
    void saveNoIdOption() {
        // given
        Options option1 = Options.builder().build();
        Options option2 = Options.builder().build();

        // when
        optionsRepository.save(option1);
        optionsRepository.save(option2);

        // then
        long idDiff = option2.getId() - option1.getId();
        assertEquals(idDiff, 1L);
    }
}
