import Button from '@/Components/Button';

function BottomButtons() {
  return (
    <div className='flex justify-center gap-2 mb-20'>
      <Button
        width='w-[300px]'
        height='h-[52px]'
        variant='secondary'
        text='색상 선택'
        onClick={() => console.log('색상 선택')}
      />
      <Button
        width='w-[300px]'
        height='h-[52px]'
        variant='primary'
        text='견적내기'
        onClick={() => console.log('견적내기')}
      />
    </div>
  );
}

export default BottomButtons;
