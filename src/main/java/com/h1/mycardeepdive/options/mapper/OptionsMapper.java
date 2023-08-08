package com.h1.mycardeepdive.options.mapper;

import com.h1.mycardeepdive.options.domain.WheelOptions;
import com.h1.mycardeepdive.options.ui.dto.WheelOptionResponse;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface OptionsMapper {
    OptionsMapper INSTANCE = Mappers.getMapper(OptionsMapper.class);

    /**
     * optionResponse Dto 변환 Mapper
     *
     * @param wheelOptions
     * @return WheelOptionResponse
     */
    @Mapping(target = "wheel_id", source = "id")
    @Mapping(target = "wheel_size", source = "wheelSize")
    @Mapping(target = "wheel_image_url", source = "optionsImageUrl")
    @Mapping(target = "wheel_name", source = "optionsName")
    @Mapping(target = "wheel_description", source = "optionsDescription")
    @Mapping(target = "wheel_price", source = "optionsPrice")
    @Mapping(target = "wheel_summary", source = "optionsSummary")
    WheelOptionResponse entityToResponse(WheelOptions wheelOptions);
}
