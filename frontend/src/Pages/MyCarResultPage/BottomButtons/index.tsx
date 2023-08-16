import Button from '@/Components/Button';

function BottomButtons() {
  return (
    <div className='flex gap-4 justify-between mb-9'>
      <Button
        width='w-[296px]'
        height='h-[52px]'
        variant='secondary'
        text='수정'
        onClick={() => console.log('수정')}
      />
      <Button
        width='w-[296px]'
        height='h-[52px]'
        variant='primary'
        text='구매/상담'
        onClick={() => console.log('구매/상담')}
      />
    </div>
  );
}

export default BottomButtons;
