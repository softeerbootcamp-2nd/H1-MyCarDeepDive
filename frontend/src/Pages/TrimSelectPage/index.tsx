import SelectionCarBackground from './SelecetionCarBackground';
import SelectionCarImage from './SelectionCarImage';
import FeatureGuideLink from './FeatureGuideLink';
import FeatureSelectRadioGroupWrapper from './FeatureSelectRadioGroupWrapper';
import SelectionCarWrapper from './SelectionCarWrapper';
import Button from '@/Components/Button';
import ReRecommendCardLink from './ReRecommendCarLink';
import TrimSelectionTitle from './TrimSelectionTitle';
import TrimComparisionButton from './TrimComparisonButton';
import TrimSelectionHeader from './TrimSelectionHeader';
import TrimSelectionRadioGroup from './TrimSelectionRadioGroup';
import { useEffect, useState } from 'react';
import FeatureSelectRadioGroup from './FeatureSelectRadioGroup';
import ColorChoiceButtonWrapper from './ColorChoiceButtonWrapper';
import FeatureAndTrimSelectionWrapper from './FeatureAndTrimSelectionWrapper';
import TrimChangeModal from './TrimChangeModal';

function SelectPage() {
  const [carFeature, setCarFeature] = useState({
    engine: '디젤 2.2',
    body: '7인승',
    operation: '2WD',
  });

  const [selectedTrim, setSelectedTrim] = useState('Le Blanc');
  const [wantedTrim, setWantedTrim] = useState('');
  const [showModal, setShowModal] = useState(false);

  const mycarFeatureHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = target;
    setCarFeature({ ...carFeature, [name]: value });
  };

  const mycarTrimHandler = () => {
    console.log('here');
    setSelectedTrim(wantedTrim);
  };

  useEffect(() => {
    console.log(wantedTrim, selectedTrim);
  });

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
          />
        </FeatureSelectRadioGroupWrapper>

        <TrimSelectionHeader>
          <TrimSelectionTitle />
          <TrimComparisionButton />
        </TrimSelectionHeader>

        <TrimSelectionRadioGroup
          selectedTrim={selectedTrim}
          carFeature={carFeature}
          setWantedTrim={setWantedTrim}
          setShowModal={setShowModal}
        />

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

      <TrimChangeModal
        showModal={showModal}
        setShowModal={setShowModal}
        mycarTrimHandler={mycarTrimHandler}
      />
    </>
  );
}

export default SelectPage;
