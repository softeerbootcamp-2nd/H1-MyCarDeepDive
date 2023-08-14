import Button from '@/Components/Button';
import { closeModalHandler } from '@/utils';
import { useNavigate } from 'react-router-dom';

interface Props {
  wantedOtherColor: string;
  changerClickHandler: React.Dispatch<React.SetStateAction<string>>;
}

function Buttons({ wantedOtherColor, changerClickHandler }: Props) {
  const navigation = useNavigate();
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
          closeModalHandler();
          // changerClickHandler(wantedOtherColor);
          setTimeout(() => {
            navigation('/select/trim');
          }, 700);
        }}
      />
    </div>
  );
}

export default Buttons;
