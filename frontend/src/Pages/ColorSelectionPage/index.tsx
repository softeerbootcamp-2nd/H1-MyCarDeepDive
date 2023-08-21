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
import { colors } from '@/global/data';
import ContentsWrapper from './ContentsWrapper';
import CarRotation from '@/Components/CarRotation';
import ControlButtons from '../TrimSelectionPage/Car/ControlButtons';
import { CarContext } from '@/context/CarProvider';
import {
  SET_EXTERIORCOLOR,
  SET_INTERIORCOLOR,
  SET_TRIMNAME,
} from '@/context/CarProvider/type';

interface colorProps {
  trim?: string;
  name: string;
  imgUrl: string;
  price: number;
  chooseRate: number;
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
  const { color, carDispatch, carSpec } = useContext(CarContext);
  const [rotation, setRotation] = useState(false);
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
    trim: carSpec.trim.name,
    colorType: 'exterior',
  });
  const interiorBestColor = getBestColor({
    colorsData: colors,
    trim: carSpec.trim.name,
    colorType: 'interior',
  });

  const unlockSelectExteriorColor = () => {
    if (exteriorBestColor?.name === undefined) return;
    if (
      exteriorColors.find(
        carColor => carColor.name === color.exteriorColor.name,
      ) === undefined
    ) {
      const { name, imgUrl, price, chooseRate } = exteriorBestColor;
      carDispatch({
        type: SET_EXTERIORCOLOR,
        exteriorColor: { name, imgUrl, price, chooseRate },
      });
    }
  };

  const unlockSelectInteriorColor = () => {
    if (interiorBestColor?.name === undefined) return;
    if (
      interiorColors.find(
        carColor => carColor.name === color.interiorColor.name,
      ) === undefined
    ) {
      const { name, imgUrl, price, chooseRate } = interiorBestColor;
      carDispatch({
        type: SET_INTERIORCOLOR,
        interiorColor: { name, imgUrl, price, chooseRate },
      });
    }
  };

  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  useEffect(() => {
    const colorData = getColorOfTrim({
      colorsData: colors,
      trim: carSpec.trim.name,
    });
    setExteriorColors(colorData?.exteriorColor || []);
    setInteriorColors(colorData?.interiorColor || []);
    setOtherExteriorColors(colorData?.otherExteriorColor || []);
    setOtherInteriorColors(colorData?.otherInteriorColor || []);
  }, [carSpec.trim.name]);

  useEffect(() => {
    unlockSelectExteriorColor();
    unlockSelectInteriorColor();
  }, [exteriorColors, interiorColors]);

  const exteriorColorHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => {
    const dataObject = currentTarget.getAttribute('data-object');
    if (!dataObject) return;
    const colorInfo = JSON.parse(dataObject);
    const { name, imgUrl, price, chooseRate } = colorInfo;
    carDispatch({
      type: SET_EXTERIORCOLOR,
      exteriorColor: { name, imgUrl, price, chooseRate },
    });
  };

  const interiorColorHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => {
    const dataObject = currentTarget.getAttribute('data-object');
    if (!dataObject) return;
    const colorInfo = JSON.parse(dataObject);
    const { name, imgUrl, price, chooseRate } = colorInfo;
    carDispatch({
      type: SET_INTERIORCOLOR,
      interiorColor: {
        name,
        imgUrl,
        price,
        chooseRate,
      },
    });
  };
  const otherExteriorColorChangeHandler = ({
    trim,
    name,
    imgUrl,
    price,
    chooseRate,
  }: any) => {
    carDispatch({ type: SET_TRIMNAME, trimName: trim });
    carDispatch({
      type: SET_EXTERIORCOLOR,
      exteriorColor: { name, imgUrl, price, chooseRate },
    });
  };

  const otherInteriorColorChangeHandler = ({
    trim,
    name,
    imgUrl,
    price,
    chooseRate,
  }: any) => {
    carDispatch({ type: SET_TRIMNAME, trimName: trim });
    carDispatch({
      type: SET_INTERIORCOLOR,
      interiorColor: { name, imgUrl, price, chooseRate },
    });
  };

  useEffect(() => {
    window.scrollTo({
      top: 0,
    });
  }, []);

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
          data={exteriorColors || []}
          selectedColor={color.exteriorColor}
          clickHandler={exteriorColorHandler}
          colorType='exterior'
        />
        <DropDown
          phrase={'다른 외장 색상을 찾고 있나요?'}
          data={otherExteriorColors || []}
          otherColorChangeHandler={otherExteriorColorChangeHandler}
        />
        <UnderLine margin='mb-6' />
        <ColorTitle title={'내장 색상'} />
        <Description
          color={color.interiorColor.name}
          chooseRate={color.interiorColor.chooseRate}
        />
        <ColorItems
          data={interiorColors || []}
          selectedColor={color.interiorColor}
          clickHandler={interiorColorHandler}
          colorType='interior'
        />
        <DropDown
          phrase={'다른 내장 색상을 찾고 있나요?'}
          data={otherInteriorColors || []}
          otherColorChangeHandler={otherInteriorColorChangeHandler}
        />
        <Buttons />
      </ContentsWrapper>
    </>
  );
}

export default ColorSelectionPage;
