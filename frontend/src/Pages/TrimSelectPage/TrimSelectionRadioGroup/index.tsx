import { TrimSelectionRadioGroupProps } from '@/global/type';
import { trimList } from '@/global/data';
import TrimSelectionRadioSelected from './TrimSelectionRadioSelected';
import TrimSelectionRadioUnselected from './TrimSelectionRadioUnselected';

function TrimSelectionRadioGroup({
  selectedTrim,
  carFeature,
  mycarTrimHandler,
  setWantedTrim,
}: TrimSelectionRadioGroupProps) {
  return trimList.map((trim, index) => {
    const { name } = trim;
    return name === selectedTrim ? (
      <TrimSelectionRadioSelected
        key={index}
        trim={trim}
        selectedTrim={selectedTrim}
        carFeature={carFeature}
        mycarTrimHandler={mycarTrimHandler}
        setWantedTrim={setWantedTrim}
      />
    ) : (
      <TrimSelectionRadioUnselected
        key={index}
        trim={trim}
        selectedTrim={selectedTrim}
        carFeature={carFeature}
        mycarTrimHandler={mycarTrimHandler}
        setWantedTrim={setWantedTrim}
      />
    );
  });
}

export default TrimSelectionRadioGroup;
