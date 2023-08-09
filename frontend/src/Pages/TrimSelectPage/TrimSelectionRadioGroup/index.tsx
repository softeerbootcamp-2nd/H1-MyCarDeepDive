import { TrimSelectionRadioGroupProps } from '@/global/type';
import { trimList } from '@/global/data';
import TrimSelectionRadioSelected from './TrimSelectionRadioSelected';
import TrimSelectionRadioUnselected from './TrimSelectionRadioUnselected';
import { useEffect } from 'react';

function TrimSelectionRadioGroup({
  selectedTrim,
  carFeature,
  mycarTrimHandler,
}: TrimSelectionRadioGroupProps) {
  useEffect(() => {
    console.log(selectedTrim);
  }, [selectedTrim]);
  return trimList.map((trim, index) => {
    const { name } = trim;
    return name === selectedTrim ? (
      <TrimSelectionRadioSelected
        key={index}
        trim={trim}
        selectedTrim={selectedTrim}
        carFeature={carFeature}
        mycarTrimHandler={mycarTrimHandler}
      />
    ) : (
      <TrimSelectionRadioUnselected
        key={index}
        trim={trim}
        selectedTrim={selectedTrim}
        carFeature={carFeature}
        mycarTrimHandler={mycarTrimHandler}
      />
    );
  });
}

export default TrimSelectionRadioGroup;
