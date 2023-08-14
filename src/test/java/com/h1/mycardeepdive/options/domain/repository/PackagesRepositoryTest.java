package com.h1.mycardeepdive.options.domain.repository;

import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.options.domain.Packages;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
class PackagesRepositoryTest {
    @Autowired PackageRepository packageRepository;

    @BeforeEach
    void setUp() {
        packageRepository.deleteAll();
    }

    @DisplayName("이미 DB에 저장되어 있는 ID를 가진 패키지옵션을 저장하면, 해당 ID의 옵션은 후에 작성된 패키지옵션 정보로 업데이트 된다.")
    @Test
    void saveSameId() {
        // given
        Packages aPackages1 = Packages.builder().name("패키지옵션1").build();
        packageRepository.save(aPackages1);

        // when
        Packages aPackages2 = Packages.builder().id(aPackages1.getId()).name("패키지옵션2").build();
        packageRepository.save(aPackages2);

        // then
        List<Packages> savedPackagesOptions = packageRepository.findAll();
        assertEquals(savedPackagesOptions.size(), 1);
        assertEquals(savedPackagesOptions.get(0).getName(), aPackages2.getName());
    }

    @DisplayName("id가 없는 패키지옵션 엔티티를 저장하면 순차적으로 ID를 부여하여 저장한다.")
    @Test
    void saveNoIdPackage() {
        // given
        Packages packagesOption1 = Packages.builder().build();
        Packages packagesOption2 = Packages.builder().build();

        // when
        packageRepository.save(packagesOption1);
        packageRepository.save(packagesOption2);

        // then
        long idDiff = packagesOption2.getId() - packagesOption1.getId();
        assertEquals(idDiff, 1L);
    }
}
