package com.h1.mycardeepdive.car.domain.repository;

import com.h1.mycardeepdive.car.domain.DrivingSystem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DrivingSystemRepository extends JpaRepository<DrivingSystem, Long> {
    DrivingSystem findByName(String drivingSystemName);
}
