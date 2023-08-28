import Selected from './Selected';
import Unselected from './Unselected';
import { useContext, useEffect } from 'react';
import { CarContext } from '@/context/CarProvider';
import getTrim, { getTrimType } from '@/api/trim/getTrim';
import { SET_CARSPECID, SET_CARSPECPRICE } from '@/context/CarProvider/type';
import UnderLine from '@/Components/UnderLine';

export interface Props {
  wantedTrimHandler: (e: React.MouseEvent<HTMLInputElement>) => void;
  setShowModal: (value: boolean) => void;
  optionToolTipHandler: (
    x: number | undefined,
    y: number | undefined,
    targetId: number,
  ) => void;
}

function TrimRadio({
  setShowModal,
  wantedTrimHandler,
  optionToolTipHandler,
}: Props) {
  const carSpecData: getTrimType | undefined = getTrim();
  const { carSpec, carDispatch } = useContext(CarContext);

  useEffect(() => {
    if (carSpecData === undefined) return;

    carDispatch({
      type: SET_CARSPECPRICE,
      carSpecPrice: carSpecData.data.car_specs[carSpec.trim.id - 1].price,
    });
    carDispatch({
      type: SET_CARSPECID,
      carSpecId: carSpecData.data.car_specs[carSpec.trim.id - 1].car_spec_id,
    });
  }, [carSpecData]);

  if (carSpecData === undefined) return null;

  return carSpecData.data.car_specs.map((car, index) => {
    return (
      <div key={car.trim_name}>
        {car.trim_id === carSpec.trim.id ? (
          <Selected
            carSpecData={car}
            optionToolTipHandler={optionToolTipHandler}
          />
        ) : (
          <Unselected
            carSpecData={car}
            wantedTrimHandler={wantedTrimHandler}
            setShowModal={setShowModal}
            optionToolTipHandler={optionToolTipHandler}
          />
        )}
        {index !== carSpecData.data.car_specs.length - 1 && (
          <UnderLine margin='' />
        )}
      </div>
    );
  });
}

export default TrimRadio;
