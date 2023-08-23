import getAllColor, {
  getInitialColorType,
  initialColorType,
} from '@/api/color/getAllColor';
import getInitialExteriorColor from '@/api/color/getInitialExteriorColor';
import getExteriorColor, {
  getExteriorColorType,
} from '@/api/color/getInitialExteriorColor';
import getInitialInteriorColor from '@/api/color/getInitialInteriorColor';
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
  const [carImageUrl, setCarImageUrl] = useState<string[]>([]);
  const allColor: getInitialColorType | undefined = getAllColor();
  const initialInteriorColor: getInteriorColorType | undefined =
    getInitialInteriorColor();
  const initialExteriorColor: getExteriorColorType | undefined =
    getInitialExteriorColor();
  const exteriorColor: getExteriorColorType | undefined = getExteriorColor();
  const interiorColor: getInteriorColorType | undefined = getInteriorColor();

  const [availableExteriorColor, setAvailableExteriorColor] =
    useState<ColorType[]>();

  const [unavailableExteriorColor, setUnavailableExteriorColor] =
    useState<ColorType[]>();

  const [exteriorColorOfOtherTrim, setExteriorColorOfOtherTrim] = useState<
    initialColorType[] | ColorType[]
  >();

  const [availableInteriorColor, setAvailableInteriorColor] =
    useState<ColorType[]>();

  const [unavailableInteriorColor, setUnavailableInteriorColor] =
    useState<ColorType[]>();

  const [interiorColorOfOtherTrim, setInteriorColorOfOtherTrim] =
    useState<ColorType[]>();

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

    const { color_id, name, img_url, price, choose_rate, car_img_urls } =
      allExteriorColorOfTrim[0];
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
    setCarImageUrl(car_img_urls);
  };

  const getInteriorColors = () => {
    if (!initialInteriorColor) return;
    setAvailableInteriorColor(initialInteriorColor.data.available_colors);
    setUnavailableInteriorColor(initialInteriorColor.data.unavailable_colors);
    setInteriorColorOfOtherTrim(initialInteriorColor.data.other_trim_colors);

    if (!availableInteriorColor) return;
    const { color_id, name, img_url, price, choose_rate } =
      availableInteriorColor[0];
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
    if (!initialExteriorColor) return;
    setAvailableExteriorColor(initialExteriorColor.data.available_colors);
    setUnavailableExteriorColor(initialExteriorColor.data.unavailable_colors);
  };

  // 외장 색상 선택 시
  // 1. 같은 트림의 가능한 외장 색상 선택 -> 외장 색상 변경 -> 같은 트림 호환 가능 내장 색상, 같은 트림 호환 안되는 내장 색상 분류
  const clickAvailableExteriorColorHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => {
    // 외장 색상 변경
    const dataObject = currentTarget.getAttribute('data-object');
    if (!dataObject) return;
    const colorInfo = JSON.parse(dataObject);
    const { color_id, name, img_url, price, choose_rate, car_img_urls } =
      colorInfo;
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
    setCarImageUrl(car_img_urls);
    // 내장 색상 분류
    if (!interiorColor) return;
    setAvailableInteriorColor(interiorColor?.data.available_colors);
    setUnavailableInteriorColor(interiorColor?.data.unavailable_colors);
  };

  // //2. 같은 트림의 호환 안되는 외장 색상 선택 -> Alert -> 변경하기 클릭 -> 외장 색상 변경 -> 호환 가능 내장, 호환 불가능 내장 분류 -> 호환 가능한 내장 색 중 채택률 높은 것 선택
  //내장 색상 선택 시
  //1. 같은 트림의 가능한 내장 색상 선택 -> 내장 색상 변경 -> 같은 트림 호환 가능 외장 색상, 같은 트림 호환 안되는 외장 색상 분류
  const clickAvailableInteriorColorHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => {
    // 내장 색상 변경
    const dataObject = currentTarget.getAttribute('data-object');
    if (!dataObject) return;
    const colorInfo = JSON.parse(dataObject);
    const { color_id, name, img_url, price, choose_rate } = colorInfo;
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

    // 외장 색상 분류
    if (!exteriorColor) return;
    setAvailableExteriorColor(exteriorColor?.data.available_colors);
    setUnavailableExteriorColor(exteriorColor?.data.unavailable_colors);
  };

  const clickUnavailableExteriorColorHandler = () => {};
  const clickOtherExteriorColorOfTrimHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => {
    const dataObject = currentTarget.getAttribute('data-object');
    if (dataObject) {
      const colorInfo = JSON.parse(dataObject);
      // setWantedOtherColor(colorInfo);
    }
  };

  const clickUnavailableInteriorColorHandler = () => {};
  const clickOtherInteriorColorOfTrimHandler = () => {};

  useEffect(() => {
    getExteriorColors();
    getInteriorColors();
    classfyExteriorColor();
  }, [allColor]);

  return {
    exteriorColors: {
      availableColor: availableExteriorColor,
      unavailableColor: unavailableExteriorColor,
      otherColorOfTrim: exteriorColorOfOtherTrim,
    },
    interiorColors: {
      availableColor: availableInteriorColor,
      unavailableColor: unavailableInteriorColor,
      otherColorOfTrim: interiorColorOfOtherTrim,
    },
    carImageUrl,
    exteriorColorsClickHandler: {
      clickAvailableColorHandler: clickAvailableExteriorColorHandler,
      clickUnavailableColorHandler: clickUnavailableExteriorColorHandler,
      clickOtherColorOfTrimHandler: clickOtherExteriorColorOfTrimHandler,
    },
    interiorColorsClickHandler: {
      clickAvailableColorHandler: clickAvailableInteriorColorHandler,
      clickUnavailableColorHandler: clickUnavailableInteriorColorHandler,
      clickOtherColorOfTrimHandler: clickOtherInteriorColorOfTrimHandler,
    },
  };
}
