import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import Button from '@/Components/Button';
import CarRotation from '@/Components/CarRotation';
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
import Guide from './Feature/Guide';
import FeatureRadio from './Feature/FeatureRadio';
import Title from './Trim/Title';
import CompareButton from './Trim/CompareButton';
import TrimRadio from './Trim/TrimRadio';
import ChangeModal from './Trim/ChangeModal';
import ControlButtons from '@/Components/ControlButtons';

function TrimSelectionPage() {
  const navigation = useNavigate();
  const [wantedTrim, setWantedTrim] = useState({
    carSpecId: null,
    price: null,
    trimId: null,
    trimName: null,
  });
  const [rotation, setRotation] = useState(false);
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

  const wantedTrimHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLInputElement>) => {
    setShowModal(true);
    const dataObject = currentTarget.getAttribute('data-object');
    if (!dataObject) return;
    const carSpecInfo = JSON.parse(dataObject);
    setWantedTrim(prevTrim => ({
      ...prevTrim,
      carSpecId: carSpecInfo.carSpecId,
      price: carSpecInfo.price,
      trimId: carSpecInfo.trimId,
      trimName: carSpecInfo.trimName,
    }));
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
      </SelectionCarWrapper>

      <FeatureAndTrimSelectionWrapper>
        <Guide />
        <FeatureSelectRadioGroupWrapper>
          <FeatureRadio
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
            wantedTrimHandler={wantedTrimHandler}
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
            onClick={() => navigation('/select/color')}
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
        wantedTrim={wantedTrim}
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
