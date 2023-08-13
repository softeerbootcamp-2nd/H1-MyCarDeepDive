package com.h1.mycardeepdive.options.domain.repository;

import com.h1.mycardeepdive.options.domain.Package;
import com.querydsl.jpa.impl.JPAQueryFactory;
import java.util.List;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Repository;

@Repository
public class PackageRepositoryImpl implements PackageRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    public PackageRepositoryImpl(EntityManager em) {
        this.queryFactory = new JPAQueryFactory(em);
    }

}
