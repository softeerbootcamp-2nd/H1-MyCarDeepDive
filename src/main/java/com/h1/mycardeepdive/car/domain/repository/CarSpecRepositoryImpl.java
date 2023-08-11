package com.h1.mycardeepdive.car.domain.repository;

import com.querydsl.jpa.impl.JPAQueryFactory;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Repository;

@Repository
public class CarSpecRepositoryImpl implements CarSpecRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    public CarSpecRepositoryImpl(EntityManager em) {
        this.queryFactory = new JPAQueryFactory(em);
    }
}
