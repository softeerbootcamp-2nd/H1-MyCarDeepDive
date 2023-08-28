import { useContext, useEffect, useState } from 'react';
import Background from '../TrimSelectionPage/Car/Background';

import ReRecommendCardLink from '../TrimSelectionPage/Car/ReRecommendCarLink';
import SelectionCarWrapper from '../TrimSelectionPage/SelectionCarWrapper';
import ColorTitle from './ColorTitle';
import Description from './Description';

import UnderLine from '@/Components/UnderLine';
import Buttons from './Buttons';
import ContentsWrapper from './ContentsWrapper';
import CarRotation from '@/Components/CarRotation';

import { CarContext } from '@/context/CarProvider';
import ControlButtons from '@/Components/ControlButtons';
import InteriorItems from './InteriorItems';
import ExteriorItems from './ExteriorItems';
import getAllColor, { getInitialColorType } from '@/api/color/getAllColor';
import getExteriorColor, {
  getExteriorColorType,
} from '@/api/color/getExteriorColor';

import getInteriorColor, {
  getInteriorColorType,
} from '@/api/color/getInteriorColors';
import ExteriorDropDown from './ExteriorDropDown';
import InteriorDropDown from './InteriorDropDown';
import getTrim, { getTrimType } from '@/api/trim/getTrim';
import InteriorImg from './InteriorImg';

function ColorSelectionPage() {
  const { color } = useContext(CarContext);
  const [rotation, setRotation] = useState(false);
  const [view, setView] = useState('exterial');
  const [exteriorCarImage, setExteriorCarImage] = useState<string[]>([]);
  const [interiorCarImage, setInteriorCarImage] = useState<string>();
  const initialAllColor: getInitialColorType | undefined = getAllColor();
  const classifiedExteriorColor: getExteriorColorType | undefined =
    getExteriorColor();
  const classifiedInteriorColor: getInteriorColorType | undefined =
    getInteriorColor();

  const getTrimInfo: getTrimType | undefined = getTrim();

  const [initialExteriorColor, setInitialExteriorColor] = useState<any>();
  const [initialInteriorColor, setInitialInteriorColor] = useState<any>();

  useEffect(() => {
    if (!classifiedExteriorColor || !initialAllColor) return;
    const idx = classifiedExteriorColor.data.available_colors.findIndex(
      item => item.color_id === color.exteriorColor.id,
    );

    setInitialExteriorColor(
      initialAllColor?.data.exterior_color_response.available_colors[
        Math.max(idx, 0)
      ],
    );

    setExteriorCarImage(
      initialAllColor?.data.exterior_color_response.available_colors[
        Math.max(idx, 0)
      ].car_img_urls,
    );
  }, [classifiedExteriorColor]);

  useEffect(() => {
    if (!classifiedInteriorColor) return;
    const idx = classifiedInteriorColor.data.available_colors.findIndex(
      item => item.color_id === color.interiorColor.id,
    );

    setInitialInteriorColor(
      initialAllColor?.data.interior_color_response.available_colors[
        Math.max(idx, 0)
      ],
    );

    setInteriorCarImage(
      initialAllColor?.data.interior_color_response.available_colors[
        Math.max(idx, 0)
      ].car_img_urls[0],
    );
  }, [classifiedInteriorColor]);

  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  useEffect(() => {
    const initialExteriorCarImage =
      initialAllColor?.data.exterior_color_response.available_colors.find(
        exteriorColor => exteriorColor.color_id === color.exteriorColor.id,
      );
    const initialInteriorCarImage =
      initialAllColor?.data.interior_color_response.available_colors.find(
        interiorColor => interiorColor.color_id === color.interiorColor.id,
      );

    if (initialExteriorCarImage)
      setExteriorCarImage(initialExteriorCarImage?.car_img_urls);
    if (initialInteriorCarImage)
      setInteriorCarImage(initialInteriorCarImage.car_img_urls[0]);
  }, [initialAllColor]);

  useEffect(() => {
    if (view === 'interial') setRotation(false);
  }, [view]);

  return (
    <>
      <SelectionCarWrapper>
        <ReRecommendCardLink />
        {view === 'exterial' && (
          <>
            <CarRotation rotation={rotation} carImageUrl={exteriorCarImage} />
            <Background />
          </>
        )}
        {view === 'interial' && (
          <InteriorImg interiorCarImage={interiorCarImage} />
        )}
        <ControlButtons
          rotation={rotation}
          setRotation={setRotation}
          view={view}
          setView={setView}
        />
      </SelectionCarWrapper>
      <ContentsWrapper>
        <ColorTitle title={'외장 색상'} />
        <Description
          color={color.exteriorColor.name}
          chooseRate={color.exteriorColor.chooseRate}
        />
        <ExteriorItems
          initialColor={initialExteriorColor}
          classifiedExteriorColor={classifiedExteriorColor}
          setExteriorCarImage={setExteriorCarImage}
          setView={setView}
        />

        <ExteriorDropDown
          classifiedExteriorColor={classifiedExteriorColor}
          getTrimInfo={getTrimInfo}
          setExteriorCarImage={setExteriorCarImage}
          setView={setView}
        />
        <UnderLine margin='mb-6' />
        <ColorTitle title={'내장 색상'} />
        <Description
          color={color.interiorColor.name}
          chooseRate={color.interiorColor.chooseRate}
        />
        <InteriorItems
          initialColor={initialInteriorColor}
          classifiedInteriorColor={classifiedInteriorColor}
          setInteriorCarImage={setInteriorCarImage}
          setView={setView}
        />
        <InteriorDropDown
          classifiedInteriorColor={classifiedInteriorColor}
          getTrimInfo={getTrimInfo}
          setView={setView}
        />
        <Buttons />
      </ContentsWrapper>
    </>
  );
}

export default ColorSelectionPage;
