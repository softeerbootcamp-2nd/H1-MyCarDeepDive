package com.h1.mycardeepdive.car.domain.repository;

import com.h1.mycardeepdive.car.domain.Car;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarRepository extends JpaRepository<Car, Long> {}
