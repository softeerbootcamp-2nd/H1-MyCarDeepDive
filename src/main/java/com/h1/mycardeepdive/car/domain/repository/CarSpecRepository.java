package com.h1.mycardeepdive.car.domain.repository;

import com.h1.mycardeepdive.car.domain.CarSpec;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarSpecRepository extends JpaRepository<CarSpec, Long>, CarSpecRepositoryCustom {}
