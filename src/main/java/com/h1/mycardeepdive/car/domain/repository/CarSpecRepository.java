package com.h1.mycardeepdive.car.domain.repository;

import com.h1.mycardeepdive.car.domain.Body;
import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.car.domain.DrivingSystem;
import com.h1.mycardeepdive.car.domain.Engine;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarSpecRepository extends JpaRepository<CarSpec, Long> {
    List<CarSpec> findByEngineAndDrivingSystemAndBody(
            Engine engine, DrivingSystem drivingSystem, Body body);
}
