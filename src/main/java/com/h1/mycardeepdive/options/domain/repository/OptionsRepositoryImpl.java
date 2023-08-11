package com.h1.mycardeepdive.options.domain.repository;

import com.querydsl.jpa.impl.JPAQueryFactory;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Repository;

@Repository
public class OptionsRepositoryImpl implements OptionsRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    public OptionsRepositoryImpl(EntityManager em) {
        this.queryFactory = new JPAQueryFactory(em);
    }
}
