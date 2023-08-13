package com.h1.mycardeepdive.tags.domain.repository;

import com.h1.mycardeepdive.tags.domain.Tags;
import java.util.List;

public interface TagRepositoryCustom {
    List<Tags> findTagsByPackageId(Long packageId);

    List<Tags> findTagsByOptionId(Long optionId);
}
