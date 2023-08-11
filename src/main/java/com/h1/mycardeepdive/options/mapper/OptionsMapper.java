package com.h1.mycardeepdive.options.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface OptionsMapper {
    OptionsMapper INSTANCE = Mappers.getMapper(OptionsMapper.class);
}
