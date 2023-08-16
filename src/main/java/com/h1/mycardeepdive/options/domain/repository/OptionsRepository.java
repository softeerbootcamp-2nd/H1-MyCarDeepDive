package com.h1.mycardeepdive.options.domain.repository;

import com.h1.mycardeepdive.options.domain.Options;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OptionsRepository extends JpaRepository<Options, Long>, OptionsRepositoryCustom {}
