import Selected from './Selected';
import Unselected from './Unselected';
import { useContext, useEffect } from 'react';
import { CarContext } from '@/context/CarProvider';
import { getTrimType } from '@/api/trim/getTrim';
import { SET_CARSPECID, SET_CARSPECPRICE } from '@/context/CarProvider/type';

export interface Props {
  wantedTrimHandler: (e: React.MouseEvent<HTMLInputElement>) => void;
  setShowModal: (value: boolean) => void;
  optionToolTipHandler: (
    x: number | undefined,
    y: number | undefined,
    target: string,
  ) => void;
  carSpecData: getTrimType | undefined;
}

function TrimRadio({
  setShowModal,
  wantedTrimHandler,
  optionToolTipHandler,
  carSpecData,
}: Props) {
  const { carSpec } = useContext(CarContext);

  const { carDispatch } = useContext(CarContext);

  useEffect(() => {
    if (carSpecData === undefined) return;

    carDispatch({
      type: SET_CARSPECPRICE,
      carSpecPrice: carSpecData.data[carSpec.trim.id - 1].price,
    });
    carDispatch({
      type: SET_CARSPECID,
      carSpecId: carSpecData.data[carSpec.trim.id - 1].car_spec_id,
    });
  }, [carSpecData]);

  if (carSpecData === undefined) return null;

  return carSpecData.data.map((car, index) => {
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
