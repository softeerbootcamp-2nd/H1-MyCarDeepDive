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

import { CarContext } from '@/context/CarProvider';
import { useInitialColor } from '@/hooks/useInitialColor';
import ControlButtons from '@/Components/ControlButtons';

function ColorSelectionPage() {
  const { color } = useContext(CarContext);
  const [rotation, setRotation] = useState(false);
  const [view, setView] = useState('exterial');
  const {
    interiorColors,
    exteriorColors,
    carImageUrl,
    exteriorColorsClickHandler,
    interiorColorsClickHandler,
  } = useInitialColor();
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  //모든 이미지 받아오기
  //

  return (
    <>
      <SelectionCarWrapper>
        <ReRecommendCardLink />
        {view === 'exterial' && (
          <>
            <CarRotation rotation={rotation} carImageUrl={carImageUrl} />
            <Background />
          </>
        )}
        {/* {view === 'interial' && } */}

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
        <ColorItems
          data={exteriorColors || []}
          selectedColor={color.exteriorColor}
          clickHandler={exteriorColorsClickHandler}
          colorType='exterior'
        />

        <DropDown
          phrase={'다른 외장 색상을 찾고 있나요?'}
          data={exteriorColors || []}
          clickHandler={exteriorColorsClickHandler}
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
          clickHandler={interiorColorsClickHandler}
          colorType='interior'
        />
        <DropDown
          phrase={'다른 내장 색상을 찾고 있나요?'}
          data={interiorColors || []}
          clickHandler={interiorColorsClickHandler}
        />
        <Buttons />
      </ContentsWrapper>
    </>
  );
}

export default ColorSelectionPage;
