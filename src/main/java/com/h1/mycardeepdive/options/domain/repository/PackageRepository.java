package com.h1.mycardeepdive.options.domain.repository;

import com.h1.mycardeepdive.options.domain.Packages;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PackageRepository extends JpaRepository<Packages, Long>, PackageRepositoryCustom {}
