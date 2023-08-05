import Button from '@/Components/Button';

function BottomButtons() {
  return (
    <div className='flex justify-between'>
      <Button
        width='w-[298px]'
        height='h-[52px]'
        variant='secondary'
        text='커스텀하기'
        onClick={() => console.log('커스텀하기')}
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

export default BottomButtons;
