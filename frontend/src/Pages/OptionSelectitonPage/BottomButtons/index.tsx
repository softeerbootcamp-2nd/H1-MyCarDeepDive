import Button from '@/Components/Button';
import { useNavigate } from 'react-router-dom';

function BottomButtons() {
  const navigation = useNavigate();

  return (
    <div className='flex justify-center gap-2 mb-20'>
      <Button
        width='w-[300px]'
        height='h-[52px]'
        variant='secondary'
        text='색상 선택'
        onClick={() => navigation('/select/color')}
      />
      <Button
        width='w-[300px]'
        height='h-[52px]'
        variant='primary'
        text='견적내기'
        onClick={() => navigation('/mycar/ready')}
      />
    </div>
  );
}

export default BottomButtons;
