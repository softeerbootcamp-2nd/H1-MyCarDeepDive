import { priceToString } from '@/utils';

interface Props {
  total_price: number;
}

function QuotationPrice({ total_price }: Props) {
  return (
    <div className='mt-[34px] mb-[66px] flex justify-between'>
      <div className='font-h5-regular text-grey-100'>
        <span className='text-[16px] leading-[26px] tracking-[-0.2px]'>
          차량 견적 총 금액
        </span>
      </div>
      <div className='font-h1-medium text-secondary'>
        <span className='text-[24px] leading-[30px]'>{`${priceToString(
          total_price,
        )}원`}</span>
      </div>
    </div>
  );
}

export default QuotationPrice;
