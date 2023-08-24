package com.h1.mycardeepdive.tags.domain.repository;

import static com.h1.mycardeepdive.tags.domain.QOptionTag.optionTag;

import com.h1.mycardeepdive.options.domain.Options;
import com.h1.mycardeepdive.tags.domain.OptionTag;
import com.querydsl.jpa.impl.JPAQueryFactory;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Repository;

@Repository
public class OptionTagRepositoryImpl implements OptionTagRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    public OptionTagRepositoryImpl(EntityManager em) {
        this.queryFactory = new JPAQueryFactory(em);
    }

    public Map<Long, OptionTag> findOptionTagByOptionListAndTagId(
            List<Options> optionsList, Long tagId) {
        return queryFactory
                .selectFrom(optionTag)
                .where(optionTag.option.in(optionsList).and(optionTag.tag.id.eq(tagId)))
                .stream()
                .collect(
                        Collectors.toMap(
                                optionTag -> optionTag.getOption().getId(),
                                optionTag -> optionTag));
    }
}
