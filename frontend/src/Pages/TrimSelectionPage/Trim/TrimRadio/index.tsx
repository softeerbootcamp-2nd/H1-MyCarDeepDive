import { TrimSelectionRadioGroupProps } from '@/global/type';
import { trimList } from '@/global/data';
import Selected from './Selected';
import Unselected from './Unselected';

function TrimRadio({
  selectedTrim,
  carFeature,
  setShowModal,
  setWantedTrim,
  optionToolTipHandler,
}: TrimSelectionRadioGroupProps) {
  return trimList.map((trim, index) => {
    const { name } = trim;
    return name === selectedTrim ? (
      <Selected
        key={index}
        trim={trim}
        selectedTrim={selectedTrim}
        carFeature={carFeature}
        setWantedTrim={setWantedTrim}
        setShowModal={setShowModal}
        optionToolTipHandler={optionToolTipHandler}
      />
    ) : (
      <Unselected
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

export default TrimRadio;
