import Button from '@/Components/Button';
import { useNavigate } from 'react-router-dom';

function BottomButtons() {
  const navigation = useNavigate();

  return (
    <div className='flex gap-4 justify-between mb-9'>
      <Button
        width='w-[296px]'
        height='h-[52px]'
        variant='secondary'
        text='수정'
        onClick={() => navigation('/select/option')}
      />
      <Button
        width='w-[296px]'
        height='h-[52px]'
        variant='primary'
        text='구매/상담'
        onClick={() =>
          window.open(
            'https://www.hyundai.com/kr/ko/e/vehicles/purchase-consult',
            '_blank',
          )
        }
      />
    </div>
  );
}

export default BottomButtons;
