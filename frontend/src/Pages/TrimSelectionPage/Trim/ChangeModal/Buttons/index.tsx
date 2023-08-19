import Button from '@/Components/Button';
import { CarContext } from '@/context/CarProvider';
import { SET_TRIM } from '@/context/CarProvider/type';
import { closeModalHandler } from '@/utils';
import { useContext } from 'react';

interface Props {
  wantedTrim: string;
}

function Buttons({ wantedTrim }: Props) {
  const { carDispatch } = useContext(CarContext);
  return (
    <div className='flex justify-end gap-2.5'>
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
        onClick={() => {
          carDispatch({ type: SET_TRIM, trim: wantedTrim });
          closeModalHandler();
        }}
      />
    </div>
  );
}

export default Buttons;
