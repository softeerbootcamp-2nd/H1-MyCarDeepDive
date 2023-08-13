package com.h1.mycardeepdive.options.domain.repository;

import com.h1.mycardeepdive.options.domain.Package;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PackageRepository extends JpaRepository<Package, Long>, PackageRepositoryCustom {}
