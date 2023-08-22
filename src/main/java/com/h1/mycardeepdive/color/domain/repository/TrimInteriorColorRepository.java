package com.h1.mycardeepdive.color.domain.repository;

import com.h1.mycardeepdive.color.domain.InteriorColor;
import com.h1.mycardeepdive.color.domain.TrimInteriorColor;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TrimInteriorColorRepository extends JpaRepository<TrimInteriorColor, Long> {
    @Query("SELECT DISTINCT tic.interiorColor FROM TrimInteriorColor tic")
    List<InteriorColor> findAllInteriorColors();

    List<TrimInteriorColor> findByTrimId(Long trimId);
}
