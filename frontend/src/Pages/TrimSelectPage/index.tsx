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
import { useState } from 'react';
import FeatureSelectRadioGroup from './FeatureSelectRadioGroup';

function SelectPage() {
  const [carFeature, setCarFeature] = useState({
    engine: '디젤 2.2',
    body: '7인승',
    operation: '2WD',
  });

  const [selectedTrim, setSelectedTrim] = useState('Le Blanc');

  const mycarFeatureHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = target;
    setCarFeature({ ...carFeature, [name]: value });
  };

  const mycarTrimHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    setSelectedTrim(target.value);
  };

  return (
    <>
      <SelectionCarWrapper>
        <ReRecommendCardLink />
        <SelectionCarBackground />
        <SelectionCarImage />
      </SelectionCarWrapper>

      <div className='absolute top-0 w-[416px] right-0 mt-[120px] px-12 py-[51px]'>
        <FeatureGuideLink />
        <FeatureSelectRadioGroupWrapper>
          <FeatureSelectRadioGroup
            carFeature={carFeature}
            onChangeHandler={mycarFeatureHandler}
          />
        </FeatureSelectRadioGroupWrapper>

        <TrimSelectionHeader>
          <TrimSelectionTitle />
          <TrimComparisionButton />
        </TrimSelectionHeader>

        <TrimSelectionRadioGroup
          selectedTrim={selectedTrim}
          carFeature={carFeature}
          mycarTrimHandler={mycarTrimHandler}
        />

        <div className='mt-6'>
          <Button
            width='w-full'
            height='h-[52px]'
            variant='primary'
            text='색상 선택'
            onClick={() => console.log('primary')}
          />
        </div>
      </div>
    </>
  );
}

export default SelectPage;
