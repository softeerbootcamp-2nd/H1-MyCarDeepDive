package com.h1.mycardeepdive.car.domain.repository;

import com.h1.mycardeepdive.car.domain.Body;
import com.h1.mycardeepdive.car.domain.CarSpecTmp;
import com.h1.mycardeepdive.car.domain.DrivingSystem;
import com.h1.mycardeepdive.car.domain.Engine;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarSpecRepository extends JpaRepository<CarSpecTmp, Long> {
    List<CarSpecTmp> findByEngineAndDrivingSystemAndBody(Engine engine, DrivingSystem drivingSystem, Body body);
}
