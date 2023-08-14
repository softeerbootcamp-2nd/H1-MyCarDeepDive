package com.h1.mycardeepdive.tags.domain.repository;

import com.h1.mycardeepdive.tags.domain.OptionTag;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OptionTagRepository extends JpaRepository<OptionTag, Long> {
    OptionTag findOptionTagByOptionIdAndTagId(Long optionId, Long tagId);
}
