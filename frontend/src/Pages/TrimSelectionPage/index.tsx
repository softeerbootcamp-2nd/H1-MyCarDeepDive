import { useState } from 'react';
import Button from '@/Components/Button';
import FeatureSelectRadioGroupWrapper from './FeatureSelectRadioGroupWrapper';
import SelectionCarWrapper from './SelectionCarWrapper';
import TrimSelectionHeader from './TrimSelectionHeader';
import ColorChoiceButtonWrapper from './ColorChoiceButtonWrapper';
import FeatureAndTrimSelectionWrapper from './FeatureAndTrimSelectionWrapper';
import ToolTip from './ToolTip';
import TrimWrapper from './TrimWrapper';
import OptionToolTip from './OptionToolTip';
import Background from './Car/Background';
import ReRecommendCardLink from './Car/ReRecommendCarLink';
import CarImage from './Car/CarImage';
import Guide from './Feature/Guide';
import FeatureRadio from './Feature/FeatureRadio';
import Title from './Trim/Title';
import CompareButton from './Trim/CompareButton';
import TrimRadio from './Trim/TrimRadio';
import ChangeModal from './Trim/ChangeModal';

function TrimSelectionPage() {
  const [carFeature, setCarFeature] = useState({
    engine: '디젤 2.2',
    body: '7인승',
    operation: '2WD',
  });
  const [selectedTrim, setSelectedTrim] = useState('Le Blanc');
  const [wantedTrim, setWantedTrim] = useState('');
  const [showModal, setShowModal] = useState(false);
  const [showToolTip, setShowToolTip] = useState(false);
  const [toolTipInfo, setToolTipInfo] = useState({
    x: 0,
    y: 0,
    name: '',
  });
  const [showOptionToolTip, setShowOptionToolTip] = useState(false);
  const [optionToolTipInfo, setOptionToolTopInfo] = useState({
    x: 0,
    y: 0,
    name: '',
  });

  const mycarFeatureHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = target;
    setCarFeature({ ...carFeature, [name]: value });
  };

  const mycarTrimHandler = () => {
    setSelectedTrim(wantedTrim);
  };

  const toolTipHandler = (
    x: number | undefined,
    y: number | undefined,
    target: string,
  ) => {
    if (!x || !y) return;
    setToolTipInfo({
      x: x - 12,
      y: y,
      name: target,
    });
    setShowToolTip(true);
  };

  const optionToolTipHandler = (
    x: number | undefined,
    y: number | undefined,
    target: string,
  ) => {
    if (!x || !y) return;
    setOptionToolTopInfo({
      x: x - 12,
      y: y,
      name: target,
    });
    setShowOptionToolTip(true);
  };

  return (
    <>
      <SelectionCarWrapper>
        <ReRecommendCardLink />
        <Background />
        <CarImage />
      </SelectionCarWrapper>

      <FeatureAndTrimSelectionWrapper>
        <Guide />
        <FeatureSelectRadioGroupWrapper>
          <FeatureRadio
            carFeature={carFeature}
            mycarFeatureHandler={mycarFeatureHandler}
            toolTipHandler={toolTipHandler}
            setShowToolTip={setShowToolTip}
          />
        </FeatureSelectRadioGroupWrapper>

        <TrimWrapper
          toolTipHandler={toolTipHandler}
          setShowToolTip={setShowToolTip}
        >
          <TrimSelectionHeader>
            <Title />
            <CompareButton />
          </TrimSelectionHeader>
          <TrimRadio
            selectedTrim={selectedTrim}
            carFeature={carFeature}
            setWantedTrim={setWantedTrim}
            setShowModal={setShowModal}
            optionToolTipHandler={optionToolTipHandler}
          />
        </TrimWrapper>

        <ColorChoiceButtonWrapper>
          <Button
            width='w-full'
            height='h-[52px]'
            variant='primary'
            text='색상 선택'
            onClick={() => console.log('primary')}
          />
        </ColorChoiceButtonWrapper>
      </FeatureAndTrimSelectionWrapper>

      <ToolTip
        toolTipInfo={toolTipInfo}
        showToolTip={showToolTip}
        setShowToolTip={setShowToolTip}
      />

      <ChangeModal
        showModal={showModal}
        setShowModal={setShowModal}
        mycarTrimHandler={mycarTrimHandler}
      />

      <OptionToolTip
        optionToolTipInfo={optionToolTipInfo}
        showOptionToolTip={showOptionToolTip}
        setShowOptionToolTip={setShowOptionToolTip}
      />
    </>
  );
}

export default TrimSelectionPage;
