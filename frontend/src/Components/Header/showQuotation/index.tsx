import Button from '@/Components/Button';

function ShowQuotationButton() {
  return (
    <div className='ml-2'>
      <Button
        width='w-[166px]'
        height='h-10'
        variant='primaryBody4'
        rounded='4px'
        text='4,000,000 원 견적내기'
        onClick={() => console.log('primary')}
      />
    </div>
  );
}

export default ShowQuotationButton;
