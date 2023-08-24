package com.h1.mycardeepdive.tags.domain.repository;

import com.h1.mycardeepdive.options.domain.Options;
import com.h1.mycardeepdive.tags.domain.OptionTag;
import java.util.List;
import java.util.Map;

public interface OptionTagRepositoryCustom {
    Map<Long, OptionTag> findOptionTagByOptionListAndTagId(List<Options> optionsList, Long tagId);
}
