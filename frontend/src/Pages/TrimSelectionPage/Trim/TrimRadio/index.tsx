import { carSpecData } from '@/global/data';
import Selected from './Selected';
import Unselected from './Unselected';
import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';

export interface Props {
  wantedTrimHandler: (e: React.MouseEvent<HTMLInputElement>) => void;
  setShowModal: (value: boolean) => void;
  optionToolTipHandler: (
    x: number | undefined,
    y: number | undefined,
    target: string,
  ) => void;
}

function TrimRadio({
  setShowModal,
  wantedTrimHandler,
  optionToolTipHandler,
}: Props) {
  const { carSpec } = useContext(CarContext);
  return carSpecData.map((car, index) => {
    return car.trim_name === carSpec.trim.name ? (
      <Selected
        key={index}
        carSpecData={car}
        optionToolTipHandler={optionToolTipHandler}
      />
    ) : (
      <Unselected
        key={index}
        carSpecData={car}
        wantedTrimHandler={wantedTrimHandler}
        setShowModal={setShowModal}
        optionToolTipHandler={optionToolTipHandler}
      />
    );
  });
}

export default TrimRadio;
