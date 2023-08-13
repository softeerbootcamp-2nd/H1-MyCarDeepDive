package com.h1.mycardeepdive.options.domain.repository;

import static com.h1.mycardeepdive.options.domain.QCarSpecOptions.carSpecOptions;
import static com.h1.mycardeepdive.options.domain.QOptionPackage.optionPackage;
import static com.h1.mycardeepdive.options.domain.QOptions.options;
import static com.h1.mycardeepdive.options.domain.QPackages.packages;

import com.h1.mycardeepdive.options.domain.Options;
import com.h1.mycardeepdive.options.domain.Packages;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import java.util.List;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Repository;

@Repository
public class OptionsRepositoryImpl implements OptionsRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    public OptionsRepositoryImpl(EntityManager em) {
        this.queryFactory = new JPAQueryFactory(em);
    }

    @Override
    public List<Options> findAdditionalOptions(Long carSpecId, List<Packages> packagesList) {

        return queryFactory
                .selectFrom(options)
                .innerJoin(carSpecOptions)
                .on(options.id.eq(carSpecOptions.options.id))
                .where(
                        carSpecOptions
                                .carSpec
                                .id
                                .eq(carSpecId)
                                .and(carSpecOptions.isBasicOption.eq(false))
                                .and(carSpecOptions.options.eq(options))
                                .and(
                                        carSpecOptions.options.notIn(
                                                JPAExpressions.selectFrom(options)
                                                        .innerJoin(optionPackage)
                                                        .on(options.id.eq(optionPackage.option.id))
                                                        .innerJoin(optionPackage)
                                                        .on(
                                                                packages.id.eq(
                                                                        optionPackage.packages.id))
                                                        .where(
                                                                optionPackage.packages.in(
                                                                        packagesList))
                                                        .select(options))))
                .fetch();
    }

    public String findPackageImgUrlFromOption(Long packageId) {
        return queryFactory
                .select(options.imgUrl)
                .from(options)
                .innerJoin(optionPackage)
                .on(options.id.eq(optionPackage.option.id))
                .innerJoin(optionPackage)
                .on(optionPackage.packages.id.eq(packages.id))
                .where(optionPackage.packages.id.eq(packageId))
                .fetchOne();
    }
}
