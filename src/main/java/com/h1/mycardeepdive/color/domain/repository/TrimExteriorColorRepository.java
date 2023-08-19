package com.h1.mycardeepdive.color.domain.repository;

import com.h1.mycardeepdive.color.domain.ExteriorColor;
import com.h1.mycardeepdive.color.domain.TrimExteriorColor;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TrimExteriorColorRepository extends JpaRepository<TrimExteriorColor, Long> {
    List<TrimExteriorColor> findByTrimId(Long trimId);

    @Query("SELECT DISTINCT tec.exteriorColor FROM TrimExteriorColor tec")
    List<ExteriorColor> findAllExteriorColors();
}
