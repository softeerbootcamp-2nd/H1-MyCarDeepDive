package com.h1.mycardeepdive.options.domain.repository;

import static com.h1.mycardeepdive.options.domain.QCarSpecPackage.carSpecPackage;
import static com.h1.mycardeepdive.options.domain.QPackages.packages;

import com.h1.mycardeepdive.options.domain.Packages;
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

    @Override
    public List<Packages> findPackageOptions(Long carSpecId) {
        return queryFactory
                .select(packages)
                .from(carSpecPackage)
                .leftJoin(carSpecPackage.packages, packages)
                .where(carSpecPackage.carSpec.id.eq(carSpecId))
                .fetch();
    }
}
