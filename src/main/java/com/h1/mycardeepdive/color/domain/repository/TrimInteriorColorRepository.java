package com.h1.mycardeepdive.color.domain.repository;

import com.h1.mycardeepdive.color.domain.TrimInteriorColor;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrimInteriorColorRepository extends JpaRepository<TrimInteriorColor, Long> {
    List<TrimInteriorColor> findByTrim_IdNot(Long id);
}
