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
import { colors } from '@/global/data';
import ContentsWrapper from './ContentsWrapper';

interface colorProps {
  trim?: string;
  name: string;
  chooseRate: number;
  url: string;
}

interface colorsProps {
  trim: string;
  exteriorColor: colorProps[];
  interiorColor: colorProps[];
  otherExteriorColor?: colorProps[];
  otherInteriorColor?: colorProps[];
}

interface Props {
  colorsData?: colorsProps[];
  colorType?: 'exterior' | 'interior';
  colorData?: colorProps[];
  selectedColor?: colorProps;
  trim?: string;
}

function getColorOfTrim({ colorsData, trim }: Props) {
  return colorsData?.find(color => color.trim === trim);
}

function getBestColor({ colorsData, trim, colorType }: Props) {
  return colorType === 'exterior'
    ? getColorOfTrim({ colorsData, trim })?.exteriorColor[0]
    : getColorOfTrim({ colorsData, trim })?.interiorColor[0];
}

function ColorSelectionPage() {
  const [trim, setTrim] = useState('Le Blanc(르블랑)');
  const [selectedExteriorColor, setSelectedExteriorColor] =
    useState<colorProps>();
  const [selectedInteriorColor, setSelectedInteriorColor] =
    useState<colorProps>();
  const [exteriorColors, setExteriorColors] = useState<colorProps[]>([]);
  const [interiorColors, setInteriorColors] = useState<colorProps[]>([]);
  const [otherExteriorColors, setOtherExteriorColors] = useState<colorProps[]>(
    [],
  );
  const [otherInteriorColors, setOtherInteriorColors] = useState<colorProps[]>(
    [],
  );
  const exteriorBestColor = getBestColor({
    colorsData: colors,
    trim,
    colorType: 'exterior',
  });
  const interiorBestColor = getBestColor({
    colorsData: colors,
    trim,
    colorType: 'interior',
  });

  const isCheckedUnlock = ({ colorData, selectedColor }: Props) => {
    return (
      colorData?.filter(color => color.name === selectedColor?.name).length ===
      0
    );
  };

  useEffect(() => {
    window.scrollTo(0, 0);
    setSelectedExteriorColor(exteriorBestColor);
    setSelectedInteriorColor(interiorBestColor);
  }, []);

  useEffect(() => {
    const colorData = getColorOfTrim({ colorsData: colors, trim });
    setExteriorColors(colorData?.exteriorColor || []);
    setInteriorColors(colorData?.interiorColor || []);
    setOtherExteriorColors(colorData?.otherExteriorColor || []);
    setOtherInteriorColors(colorData?.otherInteriorColor || []);
  }, [trim]);

  useEffect(() => {
    if (
      isCheckedUnlock({
        colorData: exteriorColors,
        selectedColor: selectedExteriorColor,
      })
    ) {
      setSelectedExteriorColor(exteriorBestColor);
    }
    if (
      isCheckedUnlock({
        colorData: interiorColors,
        selectedColor: selectedInteriorColor,
      })
    ) {
      setSelectedInteriorColor(interiorBestColor);
    }
  }, [exteriorColors, interiorColors]);

  useEffect(() => {
    console.log(selectedExteriorColor?.name, selectedInteriorColor?.name);
  });

  const exteriorColorHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => {
    const dataObject = currentTarget.getAttribute('data-object');
    if (!dataObject) return;
    const colorInfo = JSON.parse(dataObject);
    setSelectedExteriorColor(colorInfo);
  };

  const interiorColorHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => {
    const dataObject = currentTarget.getAttribute('data-object');
    if (!dataObject) return;
    const colorInfo = JSON.parse(dataObject);
    setSelectedInteriorColor(colorInfo);
  };

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
          color={selectedExteriorColor?.name}
          rate={selectedExteriorColor?.chooseRate}
        />
        <ColorRadio
          data={exteriorColors || []}
          selectedColor={selectedExteriorColor}
          clickHandler={exteriorColorHandler}
          colorType='exterior'
        />
        <DropDown
          phrase={'다른 외장 색상을 찾고 있나요?'}
          data={otherExteriorColors || []}
          changerClickHandler={setSelectedExteriorColor}
          setTrim={setTrim}
        />
        <UnderLine margin='mb-6' />
        <ColorTitle title={'내장 색상'} />
        <Description
          color={selectedInteriorColor?.name}
          rate={selectedInteriorColor?.chooseRate}
        />
        <ColorRadio
          data={interiorColors || []}
          selectedColor={selectedInteriorColor}
          clickHandler={interiorColorHandler}
          colorType='interior'
        />
        <DropDown
          phrase={'다른 내장 색상을 찾고 있나요?'}
          data={otherInteriorColors || []}
          changerClickHandler={setSelectedInteriorColor}
          setTrim={setTrim}
        />
        <Buttons />
      </ContentsWrapper>
    </>
  );
}

export default ColorSelectionPage;
