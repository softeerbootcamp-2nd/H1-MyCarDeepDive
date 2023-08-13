package com.h1.mycardeepdive.options.domain.repository;

import com.h1.mycardeepdive.options.domain.Packages;
import java.util.List;

public interface PackageRepositoryCustom {
    List<Packages> findPackageOptions(Long carSpecId);
}
