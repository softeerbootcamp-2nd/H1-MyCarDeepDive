package com.h1.mycardeepdive.options.domain.repository;

import static org.junit.jupiter.api.Assertions.*;

import com.h1.mycardeepdive.options.domain.Package;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
class PackageRepositoryTest {
    @Autowired PackageRepository packageRepository;

    @BeforeEach
    void setUp() {
        packageRepository.deleteAll();
    }

    @DisplayName("이미 DB에 저장되어 있는 ID를 가진 패키지옵션을 저장하면, 해당 ID의 옵션은 후에 작성된 패키지옵션 정보로 업데이트 된다.")
    @Test
    void saveSameId() {
        // given
        Package aPackage1 = Package.builder().name("패키지옵션1").build();
        packageRepository.save(aPackage1);

        // when
        Package aPackage2 = Package.builder().id(aPackage1.getId()).name("패키지옵션2").build();
        packageRepository.save(aPackage2);

        // then
        List<Package> savedPackageOptions = packageRepository.findAll();
        assertEquals(savedPackageOptions.size(), 1);
        assertEquals(savedPackageOptions.get(0).getName(), aPackage2.getName());
    }

    @DisplayName("id가 없는 패키지옵션 엔티티를 저장하면 순차적으로 ID를 부여하여 저장한다.")
    @Test
    void saveNoIdPackage() {
        // given
        Package packageOption1 = Package.builder().build();
        Package packageOption2 = Package.builder().build();

        // when
        packageRepository.save(packageOption1);
        packageRepository.save(packageOption2);

        // then
        long idDiff = packageOption2.getId() - packageOption1.getId();
        assertEquals(idDiff, 1L);
    }
}
