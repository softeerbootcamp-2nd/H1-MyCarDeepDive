import { useNavigate } from 'react-router-dom';
import { closeModalHandler } from '@/utils';
import Button from '@/Components/Button';

function BottomButtons() {
  const navigation = useNavigate();
  const recommendAgainHandler = () => navigation('/');

  return (
    <div className='flex justify-between'>
      <Button
        width='w-[178px]'
        height='h-[46px]'
        variant='secondary'
        text='아니요'
        onClick={closeModalHandler}
      />
      <Button
        width='w-[178px]'
        height='h-[46px]'
        variant='primary'
        text='추천받기'
        onClick={recommendAgainHandler}
      />
    </div>
  );
}

export default BottomButtons;
