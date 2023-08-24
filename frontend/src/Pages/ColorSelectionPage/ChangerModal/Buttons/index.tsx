import Button from '@/Components/Button';
import { closeModalHandler } from '@/utils';

interface Props {
  wantedOtherColor: any;
  clickHandler: () => void;
}

function Buttons({ clickHandler }: Props) {
  return (
    <div className='flex justify-end gap-2.5 mt-[33px] mb-6'>
      <Button
        width='w-[120px]'
        height='h-[46px]'
        variant='secondary'
        text='아니오'
        onClick={closeModalHandler}
      />
      <Button
        width='w-[120px]'
        height='h-[46px]'
        variant='primary'
        text='변경하기'
        onClick={() => {
          clickHandler();
          closeModalHandler();
        }}
      />
    </div>
  );
}

export default Buttons;
