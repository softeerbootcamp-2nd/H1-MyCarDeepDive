import Button from '@/Components/Button';
import { CarContext } from '@/context/CarProvider';
import {
  SET_CARSPECID,
  SET_CARSPECPRICE,
  SET_DEFAULT,
  SET_TRIMID,
  SET_TRIMNAME,
} from '@/context/CarProvider/type';
import { closeModalHandler } from '@/utils';
import { useContext } from 'react';

interface Props {
  wantedTrim: {
    carSpecId: number | null;
    price: number | null;
    trimId: number | null;
    trimName: string | null;
  };
}

function Buttons({ wantedTrim }: Props) {
  const { carDispatch } = useContext(CarContext);
  const changeTrim = () => {
    if (
      wantedTrim.price === null ||
      wantedTrim.carSpecId === null ||
      wantedTrim.trimName === null ||
      wantedTrim.trimId === null
    )
      return;
    carDispatch({
      type: SET_CARSPECPRICE,
      carSpecPrice: wantedTrim.price,
    });
    carDispatch({ type: SET_CARSPECID, carSpecId: wantedTrim.carSpecId });
    carDispatch({ type: SET_TRIMNAME, trimName: wantedTrim.trimName });
    carDispatch({ type: SET_TRIMID, trimId: wantedTrim.trimId });
    carDispatch({ type: SET_DEFAULT });

    closeModalHandler();
  };
  return (
    <div className='flex justify-end gap-2.5 mb-6'>
      <Button
        width='w-[120px]'
        height='h-[46px]'
        variant='secondary'
        text='취소하기'
        onClick={closeModalHandler}
      />
      <Button
        width='w-[120px]'
        height='h-[46px]'
        variant='primary'
        text='변경하기'
        onClick={changeTrim}
      />
    </div>
  );
}

export default Buttons;
