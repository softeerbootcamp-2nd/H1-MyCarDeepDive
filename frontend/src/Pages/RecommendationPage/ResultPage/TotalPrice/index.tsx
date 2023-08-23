import { priceToString } from '@/utils';

interface Props {
  totalPrice: number;
}

function TotalPrice({ totalPrice }: Props) {
  return (
    <div className='flex justify-between items-center mb-[59px]'>
      <div className='font-body3-regular'>
        <span className='leading-[26px] text-grey-400'>총 금액</span>
      </div>
      <div className='font-h2-medium'>
        <span className='text-2xl leading-[30px] text-grey-0'>
          {priceToString(totalPrice)}원
        </span>
      </div>
    </div>
  );
}

export default TotalPrice;
