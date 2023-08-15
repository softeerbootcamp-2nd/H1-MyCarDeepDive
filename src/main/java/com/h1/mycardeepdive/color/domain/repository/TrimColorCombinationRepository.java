package com.h1.mycardeepdive.color.domain.repository;

import com.h1.mycardeepdive.color.domain.TrimColorCombination;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrimColorCombinationRepository extends JpaRepository<TrimColorCombination, Long> {
    List<TrimColorCombination> findByTrim_Id(Long trimsId);
}
