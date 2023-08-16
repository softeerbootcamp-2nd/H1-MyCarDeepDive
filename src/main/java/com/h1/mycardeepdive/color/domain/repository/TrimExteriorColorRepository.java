package com.h1.mycardeepdive.color.domain.repository;

import com.h1.mycardeepdive.color.domain.TrimExteriorColor;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrimExteriorColorRepository extends JpaRepository<TrimExteriorColor, Long> {
    List<TrimExteriorColor> findByTrim_IdNot(Long id);
}
