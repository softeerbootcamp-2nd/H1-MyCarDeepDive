import { useNavigate } from 'react-router-dom';
import Button from '@/Components/Button';

function Buttons() {
  const navigation = useNavigate();

  return (
    <div className='fixed bottom-[36px] left-0 z-20 w-full flex justify-center gap-2'>
      <Button
        width='w-[300px]'
        height='h-[52px]'
        variant='transparent'
        text='직접 만들래요'
        onClick={() => console.log('transparent')}
      />
      <Button
        width='w-[300px]'
        height='h-[52px]'
        variant='white'
        text='추천받기'
        onClick={() => navigation('/recommend/question')}
      />
    </div>
  );
}

export default Buttons;
