package com.h1.mycardeepdive.color.domain.repository;

import com.h1.mycardeepdive.color.domain.TrimsColorCombination;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrimsColorCombinationRepository
        extends JpaRepository<TrimsColorCombination, Long> {
    List<TrimsColorCombination> findByTrims_Id(Long trimsId);
}
