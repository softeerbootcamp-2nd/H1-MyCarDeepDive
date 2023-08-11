package com.h1.mycardeepdive.car.domain.repository;

import com.h1.mycardeepdive.car.domain.Engine;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EngineRepository extends JpaRepository<Engine, Long> {
    Engine findByName(String engineName);
}
