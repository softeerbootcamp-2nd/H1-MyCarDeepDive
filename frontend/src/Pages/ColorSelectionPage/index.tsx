import { useEffect, useState } from 'react';
import Background from '../TrimSelectionPage/Car/Background';
import CarImage from '../TrimSelectionPage/Car/CarImage';
import ReRecommendCardLink from '../TrimSelectionPage/Car/ReRecommendCarLink';
import SelectionCarWrapper from '../TrimSelectionPage/SelectionCarWrapper';
import ColorTitle from './ColorTitle';
import Description from './Description';
import ColorRadio from './ColorRadio';

import UnderLine from '@/Components/UnderLine';
import DropDown from './DropDown';
import Buttons from './Buttons';
import {
  exteriorColor,
  interiorColor,
  otherExteriorColor,
  otherInteriorColor,
} from '@/global/data';
import ContentsWrapper from './ContentsWrapper';

function getColorChooseRate({
  colorData,
  selectedColor,
}: {
  colorData: {
    name: string;
    chooseRate: number;
    url: string;
  }[];
  selectedColor: string;
}) {
  return colorData.filter(color => selectedColor === color.name)[0].chooseRate;
}

function ColorSelectionPage() {
  const [selectedExteriorColor, setSelectedExteriorColor] =
    useState('크리미 화이트 펄');

  const [selectedInteriorColor, setSelectedInteriorColor] =
    useState('퀄팅 천연(블랙)');

  const exteriorColorHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    setSelectedExteriorColor(target.value);
  };

  const interiorColorHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    setSelectedInteriorColor(target.value);
  };

  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  useEffect(() => {
    console.log(selectedExteriorColor, selectedInteriorColor);
  }, [selectedExteriorColor, selectedInteriorColor]);

  return (
    <>
      <SelectionCarWrapper>
        <ReRecommendCardLink />
        <Background />
        <CarImage />
      </SelectionCarWrapper>
      <ContentsWrapper>
        <ColorTitle title={'외장 색상'} />
        <Description
          color={selectedExteriorColor}
          rate={getColorChooseRate({
            colorData: exteriorColor,
            selectedColor: selectedExteriorColor,
          })}
        />
        <ColorRadio
          data={exteriorColor}
          radioTarget={selectedExteriorColor}
          radioHandler={exteriorColorHandler}
          colorType='exterior'
        />
        <DropDown
          phrase={'다른 외장 색상을 찾고 있나요?'}
          data={otherExteriorColor}
          changerClickHandler={setSelectedExteriorColor}
        />
        <UnderLine margin='mb-6' />
        <ColorTitle title={'내장 색상'} />
        <Description
          color={selectedInteriorColor}
          rate={getColorChooseRate({
            colorData: interiorColor,
            selectedColor: selectedInteriorColor,
          })}
        />
        <ColorRadio
          data={interiorColor}
          radioTarget={selectedInteriorColor}
          radioHandler={interiorColorHandler}
          colorType='interior'
        />
        <DropDown
          phrase={'다른 내장 색상을 찾고 있나요?'}
          data={otherInteriorColor}
          changerClickHandler={setSelectedInteriorColor}
        />
        <Buttons />
      </ContentsWrapper>
    </>
  );
}

export default ColorSelectionPage;
