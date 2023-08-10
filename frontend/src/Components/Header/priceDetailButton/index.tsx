import Button from '@/Components/Button';
import { setPriceInfoProps } from '@/global/type';

function PriceDetailButton({
  setShowPriceInfo,
  showPriceInfo,
}: setPriceInfoProps) {
  return (
    <div className='ml-[50px]'>
      <Button
        width='w-[91px]'
        height='h-10'
        rounded='4px'
        variant='grey400'
        text='요금 상세'
        onClick={() => setShowPriceInfo(!showPriceInfo)}
      />
    </div>
  );
}

export default PriceDetailButton;
