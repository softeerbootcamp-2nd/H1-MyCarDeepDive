import { useContext, useEffect, useState } from 'react';
import Background from '../TrimSelectionPage/Car/Background';

import ReRecommendCardLink from '../TrimSelectionPage/Car/ReRecommendCarLink';
import SelectionCarWrapper from '../TrimSelectionPage/SelectionCarWrapper';
import ColorTitle from './ColorTitle';
import Description from './Description';
import ColorItems from './ColorItems';

import UnderLine from '@/Components/UnderLine';
import DropDown from './DropDown';
import Buttons from './Buttons';
import ContentsWrapper from './ContentsWrapper';
import CarRotation from '@/Components/CarRotation';
import ControlButtons from '../TrimSelectionPage/Car/ControlButtons';
import { CarContext } from '@/context/CarProvider';
import {
  SET_EXTERIORCOLOR,
  SET_INTERIORCOLOR,
} from '@/context/CarProvider/type';
import { useInitialColor } from '@/hooks/useInitialColor';

function ColorSelectionPage() {
  const { color, carDispatch } = useContext(CarContext);
  const [rotation, setRotation] = useState(false);
  const { interiorColors, exteriorColors } = useInitialColor();
  const {
    availableInteriorColor,
    unavailableInteriorColor,
    interiorColorOfOtherTrim,
  } = interiorColors;
  const {
    availableExteriorColor,
    unavailableExteriorColor,
    exteriorColorOfOtherTrim,
  } = exteriorColors;

  // 외장 색상 선택 시
  // 1. 같은 트림의 가능한 외장 색상 선택 -> 외장 색상 변경 -> 같은 트림 호환 가능 내장 색상, 같은 트림 호환 안되는 내장 색상 분류
  const clickAvailableExteriorColorHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => {
    // 외장 색상 변경
    const dataObject = currentTarget.getAttribute('data-object');
    if (!dataObject) return;
    const colorInfo = JSON.parse(dataObject);
    const { color_id, name, img_url, price, choose_rate } = colorInfo;
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
    //내장 색상 분류
    // if (!interiorColor) return;
    // setAvailableInteriorColor(interiorColor?.data.available_colors);
    // setUnavailableInteriorColor(interiorColor?.data.unavailable_colors);
  };

  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);
  //getExteriorColors();

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

    //외장 색상 분류
    // if (!exteriorColor) return;
    // setAvailableExteriorColor(exteriorColor?.data.available_colors);
    // setUnavailableExteriorColor(exteriorColor?.data.unavailable_colors);
  };

  return (
    <>
      <SelectionCarWrapper>
        <ReRecommendCardLink />
        <Background />
        <CarRotation rotation={rotation} />
        <ControlButtons rotation={rotation} setRotation={setRotation} />
      </SelectionCarWrapper>
      <ContentsWrapper>
        <ColorTitle title={'외장 색상'} />
        <Description
          color={color.exteriorColor.name}
          chooseRate={color.exteriorColor.chooseRate}
        />
        <ColorItems
          data={availableExteriorColor || []}
          //unavailableData={unavailableExteriorColor || []}
          selectedColor={color.exteriorColor}
          clickHandler={clickAvailableExteriorColorHandler}
          // clickUnavailableHandler={setunavailableExteriorColor}
          colorType='exterior'
        />
        <DropDown
          phrase={'다른 외장 색상을 찾고 있나요?'}
          data={exteriorColorOfOtherTrim || []}
          otherColorChangeHandler={clickAvailableExteriorColorHandler}
        />
        <UnderLine margin='mb-6' />
        <ColorTitle title={'내장 색상'} />
        <Description
          color={color.interiorColor.name}
          chooseRate={color.interiorColor.chooseRate}
        />
        <ColorItems
          data={availableInteriorColor || []}
          //unavailableData={unavailableInteriorColor || []}
          selectedColor={color.interiorColor}
          clickHandler={clickAvailableInteriorColorHandler}
          // clickUnavailableHandler={setunavailableInteriorColor}
          colorType='interior'
        />
        <DropDown
          phrase={'다른 내장 색상을 찾고 있나요?'}
          data={interiorColorOfOtherTrim || []}
          otherColorChangeHandler={clickAvailableExteriorColorHandler}
        />
        <Buttons />
      </ContentsWrapper>
    </>
  );
}

export default ColorSelectionPage;
