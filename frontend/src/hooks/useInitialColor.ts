import getAllColor, {
  getInitialColorType,
  initialColorType,
} from '@/api/color/getAllColor';
import getExteriorColor, {
  getExteriorColorType,
} from '@/api/color/getInitialExteriorColor';
import getInteriorColor, {
  getInteriorColorType,
} from '@/api/color/getInitialInteriorColor';
import { CarContext } from '@/context/CarProvider';
import {
  SET_EXTERIORCOLOR,
  SET_INTERIORCOLOR,
} from '@/context/CarProvider/type';
import { ColorType } from '@/global/type';
import { useContext, useEffect, useState } from 'react';

export function useInitialColor() {
  const { color, carDispatch } = useContext(CarContext);
  const allColor: getInitialColorType | undefined = getAllColor();
  const interiorColor: getInteriorColorType | undefined = getInteriorColor();
  const exteriorColor: getExteriorColorType | undefined = getExteriorColor();

  const [availableExteriorColor, setAvailableExteriorColor] =
    useState<ColorType[]>();

  const [unavailableExteriorColor, setUnavailableExteriorColor] =
    useState<ColorType[]>();

  const [exteriorColorOfOtherTrim, setExteriorColorOfOtherTrim] =
    useState<initialColorType[]>();

  const [availableInteriorColor, setAvailableInteriorColor] =
    useState<ColorType[]>();

  const [unavailableInteriorColor, setUnavailableInteriorColor] =
    useState<ColorType[]>();

  const [interiorColorOfOtherTrim, setInteriorColorOfOtherTrim] =
    useState<ColorType[]>();

  // 추천을 받지 않고 들어온 경우 기본값: 채택률 가장 높은 것
  const getExteriorColors = () => {
    if (!allColor) return;
    const allExteriorColorOfTrim = [];
    for (const key in allColor?.data.exterior_color_response) {
      if (key === 'available_colors' || key === 'unavailable_colors')
        allExteriorColorOfTrim.push(
          ...allColor?.data.exterior_color_response[key],
        );
      else if (key === 'other_trim_colors') {
        setExteriorColorOfOtherTrim(
          allColor.data.exterior_color_response.other_trim_colors,
        );
      }
    }
    const highestChooseRateColor = allExteriorColorOfTrim.sort(
      (a, b) => b.choose_rate - a.choose_rate,
    )[0];
    if (!highestChooseRateColor) return;
    const { color_id, name, img_url, price, choose_rate } =
      highestChooseRateColor;
    if (color.exteriorColor.id !== color_id)
      carDispatch({
        type: SET_EXTERIORCOLOR,
        exteriorColor: {
          id: color_id,
          name,
          imgUrl: img_url,
          price,
          chooseRate: choose_rate,
        },
      });
  };

  const getInteriorColors = () => {
    if (!interiorColor) return;
    setAvailableInteriorColor(interiorColor.data.available_colors);
    setUnavailableInteriorColor(interiorColor.data.unavailable_colors);
    setInteriorColorOfOtherTrim(interiorColor.data.other_trim_colors);

    if (!availableInteriorColor) return;
    const highestChooseRateColor = availableInteriorColor.sort(
      (a, b) => b.choose_rate - a.choose_rate,
    )[0];
    if (!highestChooseRateColor) return;
    const { color_id, name, img_url, price, choose_rate } =
      highestChooseRateColor;
    if (color.interiorColor.id !== color_id)
      carDispatch({
        type: SET_INTERIORCOLOR,
        interiorColor: {
          id: color_id,
          name,
          imgUrl: img_url,
          price,
          chooseRate: choose_rate,
        },
      });
  };

  const classfyExteriorColor = () => {
    if (!exteriorColor) return;
    setAvailableExteriorColor(exteriorColor.data.available_colors);
    setUnavailableExteriorColor(exteriorColor.data.unavailable_colors);
  };

  useEffect(() => {
    getExteriorColors();
    getInteriorColors();
    classfyExteriorColor();
  }, [allColor]);

  return {
    exteriorColors: {
      availableExteriorColor,
      unavailableExteriorColor,
      exteriorColorOfOtherTrim,
    },
    interiorColors: {
      availableInteriorColor,
      unavailableInteriorColor,
      interiorColorOfOtherTrim,
    },
  };
}
