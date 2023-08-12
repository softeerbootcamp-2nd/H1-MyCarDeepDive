import { useEffect, useState } from 'react';
import Background from '../TrimSelectionPage/Car/Background';
import CarImage from '../TrimSelectionPage/Car/CarImage';
import ReRecommendCardLink from '../TrimSelectionPage/Car/ReRecommendCarLink';
import FeatureAndTrimSelectionWrapper from '../TrimSelectionPage/FeatureAndTrimSelectionWrapper';
import SelectionCarWrapper from '../TrimSelectionPage/SelectionCarWrapper';

import Abyss from '@/assets/image/exterior-abyss.png';
import Shimmering from '@/assets/image/exterior-shimmering.png';
import Moonlight from '@/assets/image/exterior-moonlight.png';
import Gaia from '@/assets/image/exterior-gaia.png';
import Graphite from '@/assets/image/exterior-graphite.png';
import Creamy from '@/assets/image/exterior-creamy.png';
import Quilted from '@/assets/image/interior-quilted.png';
import CoolGray from '@/assets/image/interior-coolgray.png';
import ColorTitle from './ColorTitle';
import Description from './Description';
import ColorRadio from './ColorRadio';

import UnderLine from '@/Components/UnderLine';
import DropDown from './DropDown';
import Buttons from './Buttons';

const exteriorColor = [
  {
    name: '어비스 블랙펄',
    chooseRate: 70,
    url: Abyss,
  },
  {
    name: '쉬머링 실버 메탈릭',
    chooseRate: 60,
    url: Shimmering,
  },
  {
    name: '문라이트 블루 펄',
    chooseRate: 50,
    url: Moonlight,
  },
  {
    name: '가이아 브라운 펄',
    chooseRate: 40,
    url: Gaia,
  },
  {
    name: '그라파이트 그레이 메탈릭',
    chooseRate: 30,
    url: Graphite,
  },
  {
    name: '크리미 화이트 펄',
    chooseRate: 20,
    url: Creamy,
  },
];

const interiorColor = [
  {
    name: '퀄팅 천연(블랙)',
    chooseRate: 70,
    url: Quilted,
  },
  {
    name: '쿨 그레이',
    chooseRate: 60,
    url: CoolGray,
  },
];

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
    console.log(selectedExteriorColor);
  }, [selectedExteriorColor]);

  return (
    <>
      <SelectionCarWrapper>
        <ReRecommendCardLink />
        <Background />
        <CarImage />
      </SelectionCarWrapper>

      <FeatureAndTrimSelectionWrapper>
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
          type='exterior'
        />

        <DropDown phrase={'다른 외장 색상을 찾고 있나요?'} />
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
          type='interior'
        />

        <DropDown phrase={'다른 내장 색상을 찾고 있나요?'} />
        <Buttons />
      </FeatureAndTrimSelectionWrapper>
    </>
  );
}

export default ColorSelectionPage;
