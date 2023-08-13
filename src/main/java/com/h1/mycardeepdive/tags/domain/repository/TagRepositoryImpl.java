package com.h1.mycardeepdive.tags.domain.repository;

import static com.h1.mycardeepdive.tags.domain.QOptionTag.optionTag;
import static com.h1.mycardeepdive.tags.domain.QPackageTag.packageTag;
import static com.h1.mycardeepdive.tags.domain.QTags.tags;

import com.h1.mycardeepdive.tags.domain.Tags;
import com.querydsl.jpa.impl.JPAQueryFactory;
import java.util.List;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Repository;

@Repository
public class TagRepositoryImpl implements TagRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    public TagRepositoryImpl(EntityManager em) {
        this.queryFactory = new JPAQueryFactory(em);
    }

    @Override
    public List<Tags> findTagsByPackageId(Long packageId) {
        return queryFactory
                .selectFrom(tags)
                .innerJoin(packageTag)
                .on(tags.id.eq(packageTag.tag.id))
                .where(packageTag.packages.id.eq(packageId))
                .fetch();
    }

    @Override
    public List<Tags> findTagsByOptionId(Long optionId) {
        return queryFactory
                .selectFrom(tags)
                .innerJoin(optionTag)
                .on(tags.id.eq(optionTag.tag.id))
                .where(optionTag.option.id.eq(optionId))
                .fetch();
    }
}
