import { TrimSelectionRadioGroupProps } from '@/global/type';
import { trimList } from '@/global/data';
import TrimSelectionRadioSelected from './TrimSelectionRadioSelected';
import TrimSelectionRadioUnselected from './TrimSelectionRadioUnselected';

function TrimSelectionRadioGroup({
  selectedTrim,
  carFeature,
  setShowModal,
  setWantedTrim,
  optionToolTipHandler,
}: TrimSelectionRadioGroupProps) {
  return trimList.map((trim, index) => {
    const { name } = trim;
    return name === selectedTrim ? (
      <TrimSelectionRadioSelected
        key={index}
        trim={trim}
        selectedTrim={selectedTrim}
        carFeature={carFeature}
        setWantedTrim={setWantedTrim}
        setShowModal={setShowModal}
        optionToolTipHandler={optionToolTipHandler}
      />
    ) : (
      <TrimSelectionRadioUnselected
        key={index}
        trim={trim}
        selectedTrim={selectedTrim}
        carFeature={carFeature}
        setWantedTrim={setWantedTrim}
        setShowModal={setShowModal}
        optionToolTipHandler={optionToolTipHandler}
      />
    );
  });
}

export default TrimSelectionRadioGroup;
