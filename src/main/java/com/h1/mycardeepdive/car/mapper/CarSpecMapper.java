package com.h1.mycardeepdive.car.mapper;

import com.h1.mycardeepdive.car.domain.CarSpec;
import com.h1.mycardeepdive.car.ui.dto.CarSpecComparisonResponse;
import com.h1.mycardeepdive.car.ui.dto.CarSpecInfo;
import com.h1.mycardeepdive.color.domain.TrimExteriorColor;
import com.h1.mycardeepdive.color.domain.TrimInteriorColor;
import com.h1.mycardeepdive.trims.domain.Trim;
import java.util.ArrayList;
import java.util.List;

public class CarSpecMapper {
    public static CarSpecComparisonResponse toCarSpecComparisonResponse(
            CarSpec carSpec, List<String> basicOptionNames, List<Long> basicOptionIds) {
        Trim trim = carSpec.getTrim();
        List<String> exteriorColorImgUrls = new ArrayList<>();
        List<String> interiorColorNames = new ArrayList<>();
        for (TrimExteriorColor trimExteriorColor : trim.getTrimExteriorColors()) {
            exteriorColorImgUrls.add(trimExteriorColor.getExteriorColor().getImgUrl());
        }
        for (TrimInteriorColor trimInteriorColor : trim.getTrimInteriorColors()) {
            interiorColorNames.add(trimInteriorColor.getInteriorColor().getName());
        }
        return new CarSpecComparisonResponse(
                trim.getImgUrl(),
                trim.getSummary(),
                trim.getName(),
                carSpec.getPrice(),
                exteriorColorImgUrls,
                interiorColorNames,
                trim.getWheelSize(),
                trim.getWheelName(),
                trim.getSeatName(),
                trim.getNavigationSize(),
                trim.getClusterSize(),
                basicOptionNames,
                basicOptionIds);
    }

    public static CarSpecInfo toCarSpecResponse(
            CarSpec carSpec,
            List<String> basicOptionNames,
            List<Long> basicOptionIds,
            List<String> basicOptionUrls) {
        Trim trim = carSpec.getTrim();
        return new CarSpecInfo(
                trim.getName(),
                carSpec.getPrice(),
                trim.getSummary(),
                carSpec.getId(),
                trim.getId(),
                trim.getImgUrl(),
                basicOptionNames,
                basicOptionIds,
                basicOptionUrls);
    }
}
