import Button from '@/Components/Button';

function Buttons() {
  return (
    <div className='flex gap-2'>
      <Button
        width='w-[300px]'
        height='h-[52px]'
        variant='secondary'
        text='트림 선택'
        onClick={() => console.log('secondary')}
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
