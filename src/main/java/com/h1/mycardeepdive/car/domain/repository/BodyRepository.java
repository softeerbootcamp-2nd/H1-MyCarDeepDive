package com.h1.mycardeepdive.car.domain.repository;

import com.h1.mycardeepdive.car.domain.Body;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BodyRepository extends JpaRepository<Body, Long> {
    Body findByName(String bodyName);
}
