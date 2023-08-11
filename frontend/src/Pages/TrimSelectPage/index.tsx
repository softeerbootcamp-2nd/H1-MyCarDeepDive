import { useState } from 'react';
import Button from '@/Components/Button';
import SelectionCarBackground from './SelecetionCarBackground';
import SelectionCarImage from './SelectionCarImage';
import FeatureGuideLink from './FeatureGuideLink';
import FeatureSelectRadioGroupWrapper from './FeatureSelectRadioGroupWrapper';
import SelectionCarWrapper from './SelectionCarWrapper';
import ReRecommendCardLink from './ReRecommendCarLink';
import TrimSelectionTitle from './TrimSelectionTitle';
import TrimComparisionButton from './TrimComparisonButton';
import TrimSelectionHeader from './TrimSelectionHeader';
import TrimSelectionRadioGroup from './TrimSelectionRadioGroup';
import FeatureSelectRadioGroup from './FeatureSelectRadioGroup';
import ColorChoiceButtonWrapper from './ColorChoiceButtonWrapper';
import FeatureAndTrimSelectionWrapper from './FeatureAndTrimSelectionWrapper';
import ToolTip from './ToolTip';
import TrimWrapper from './TrimWrapper';
import TrimChangeModal from './TrimChangeModal';
import OptionToolTip from './OptionToolTip';

function TrimSelectPage() {
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
        <SelectionCarBackground />
        <SelectionCarImage />
      </SelectionCarWrapper>

      <FeatureAndTrimSelectionWrapper>
        <FeatureGuideLink />
        <FeatureSelectRadioGroupWrapper>
          <FeatureSelectRadioGroup
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
            <TrimSelectionTitle />
            <TrimComparisionButton />
          </TrimSelectionHeader>
          <TrimSelectionRadioGroup
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

      <TrimChangeModal
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

export default TrimSelectPage;
