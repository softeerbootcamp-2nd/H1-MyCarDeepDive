package com.h1.mycardeepdive.options.domain.repository;

import com.h1.mycardeepdive.options.domain.Options;
import com.h1.mycardeepdive.options.domain.Packages;
import java.util.List;

public interface OptionsRepositoryCustom {
    List<Options> findAdditionalOptions(Long carSpecId, List<Packages> packagesList);

    String findPackageImgUrlFromOption(Long packageId);

    List<Options> findBasicOptions(Long carSpecId);

    List<Options> findOptionsByPackageId(Long packageId);

    List<Options> findOptionsByTagIdAndCarSpecId(Long tagId, Long carSpecId);
}
