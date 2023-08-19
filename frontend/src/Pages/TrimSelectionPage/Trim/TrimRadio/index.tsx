import { trimList } from '@/global/data';
import Selected from './Selected';
import Unselected from './Unselected';
import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';

export interface Props {
  setWantedTrim: React.Dispatch<React.SetStateAction<string>>;
  setShowModal: (value: boolean) => void;
  optionToolTipHandler: (
    x: number | undefined,
    y: number | undefined,
    target: string,
  ) => void;
}

function TrimRadio({
  setShowModal,
  setWantedTrim,
  optionToolTipHandler,
}: Props) {
  const { trim } = useContext(CarContext);
  return trimList.map((carTrim, index) => {
    return carTrim.name === trim ? (
      <Selected
        key={index}
        carTrim={carTrim}
        optionToolTipHandler={optionToolTipHandler}
      />
    ) : (
      <Unselected
        key={index}
        carTrim={carTrim}
        setWantedTrim={setWantedTrim}
        setShowModal={setShowModal}
        optionToolTipHandler={optionToolTipHandler}
      />
    );
  });
}

export default TrimRadio;
