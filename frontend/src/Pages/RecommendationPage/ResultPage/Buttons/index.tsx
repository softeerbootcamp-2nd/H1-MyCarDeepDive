import Button from '@/Components/Button';
import { useNavigate } from 'react-router';

function Buttons() {
  const navigate = useNavigate();
  return (
    <div className='flex justify-between'>
      <Button
        width='w-[298px]'
        height='h-[52px]'
        variant='secondary'
        text='커스텀하기'
        onClick={() => navigate('/select/trim')}
      />
      <Button
        width='w-[298px]'
        height='h-[52px]'
        variant='primary'
        text='빠른 견적내기'
        onClick={() => console.log('빠른 견적내기')}
      />
    </div>
  );
}

export default Buttons;
