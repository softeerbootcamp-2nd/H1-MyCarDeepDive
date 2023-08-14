package com.h1.mycardeepdive.tags.mapper;

import com.h1.mycardeepdive.tags.domain.Tags;
import com.h1.mycardeepdive.tags.ui.TagResponse;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface TagsMapper {
    TagsMapper INSTANCE = Mappers.getMapper(TagsMapper.class);

    @Mapping(source = "id", target = "tag_id")
    @Mapping(source = "name", target = "tag_name")
    TagResponse tagsToTagResponse(Tags tags);
}
