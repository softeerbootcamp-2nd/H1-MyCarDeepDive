import Button from '@/Components/Button';
import NavigationRadioGroup from './NavigationRadioGroup';

function Navigation() {
  return (
    <div className='flex'>
      <NavigationRadioGroup />
      <div className='mt-[10px] flex'>
        <div className='ml-[50px]'></div>
        <Button
          width='w-[91px]'
          height='h-10'
          rounded='4px'
          variant='grey400'
          text='요금 상세'
          onClick={() => console.log('secondary')}
        />
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
      </div>
    </div>
  );
}

export default Navigation;
