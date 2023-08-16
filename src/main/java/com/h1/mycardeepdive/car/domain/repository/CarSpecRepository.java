package com.h1.mycardeepdive.car.domain.repository;

import com.h1.mycardeepdive.car.domain.CarSpec;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarSpecRepository extends JpaRepository<CarSpec, Long> {
    List<CarSpec> findByEngine_nameAndBody_nameAndDrivingSystem_name(
            String engineName, String bodyName, String drivingSystemName);
}
