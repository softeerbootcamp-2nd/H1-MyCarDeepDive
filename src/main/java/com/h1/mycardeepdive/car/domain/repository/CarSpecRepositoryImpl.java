package com.h1.mycardeepdive.car.domain.repository;

import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;

@Repository
public class CarSpecRepositoryImpl implements CarSpecRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    public CarSpecRepositoryImpl(EntityManager em) {
        this.queryFactory = new JPAQueryFactory(em);
    }

}
