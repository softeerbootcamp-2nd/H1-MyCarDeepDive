import Button from '@/Components/Button';
import { useNavigate } from 'react-router-dom';

function Buttons() {
  const navigation = useNavigate();
  return (
    <div className='flex gap-2'>
      <Button
        width='w-[300px]'
        height='h-[52px]'
        variant='secondary'
        text='트림 선택'
        onClick={() => navigation('/select/trim')}
      />
      <Button
        width='w-[300px]'
        height='h-[52px]'
        variant='primary'
        text='옵션 선택'
        onClick={() => console.log('primary')}
      />
    </div>
  );
}

export default Buttons;
