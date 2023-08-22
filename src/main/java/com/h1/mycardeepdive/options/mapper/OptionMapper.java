package com.h1.mycardeepdive.options.mapper;

import com.h1.mycardeepdive.options.domain.Options;
import com.h1.mycardeepdive.options.domain.Packages;
import com.h1.mycardeepdive.options.ui.dto.*;
import com.h1.mycardeepdive.tags.domain.OptionTag;
import com.h1.mycardeepdive.tags.domain.Tags;
import com.h1.mycardeepdive.tags.mapper.TagsMapper;
import java.util.List;
import java.util.stream.Collectors;

public class OptionMapper {

    public static AdditionalOptionResponse optionToAdditionalOptionResponse(
            Options option, List<Tags> tagsList) {
        return new AdditionalOptionResponse(
                option.getId(),
                option.getImgUrl(),
                option.getChooseRate(),
                option.getName(),
                option.getSummary(),
                tagsList.stream()
                        .map(TagsMapper.INSTANCE::tagsToTagResponse)
                        .collect(Collectors.toList()),
                option.getBadgeName().getViewName(),
                option.getPrice());
    }

    public static PackageOptionResponse optionToPackageOptionResponse(
            Packages _packages, List<Tags> tagsList, List<Options> optionsList, String imgUrl) {
        return new PackageOptionResponse(
                _packages.getId(),
                imgUrl,
                _packages.getChooseRate(),
                _packages.getName(),
                _packages.getSummary(),
                tagsList.stream()
                        .map(TagsMapper.INSTANCE::tagsToTagResponse)
                        .collect(Collectors.toList()),
                _packages.getBadgeName().getViewName(),
                _packages.getPrice(),
                optionsList.stream().map(Options::getId).collect(Collectors.toList()));
    }

    public static BasicOptionResponse optionToBasicOptionResponse(
            Options options, List<Tags> tagsList) {
        return new BasicOptionResponse(
                options.getId(),
                options.getImgUrl(),
                options.getName(),
                tagsList.stream()
                        .map(TagsMapper.INSTANCE::tagsToTagResponse)
                        .collect(Collectors.toList()));
    }

    public static OptionDetailResponse optionToOptionDetailResponse(
            Options options, List<Tags> tagsList) {
        return new OptionDetailResponse(
                options.getId(),
                options.getName(),
                options.getDescription(),
                tagsList.stream()
                        .map(TagsMapper.INSTANCE::tagsToTagResponse)
                        .collect(Collectors.toList()),
                options.getPrice(),
                options.getImgUrl());
    }

    public static OptionCoordinatesResponse optionToOptionCoordinatesResponse(
            Options options, OptionTag optionTag) {
        return new OptionCoordinatesResponse(
                options.getId(),
                options.getName(),
                options.getDescription(),
                options.getImgUrl(),
                options.getPrice(),
                optionTag.getPosition_x(),
                optionTag.getPosition_y());
    }
}
