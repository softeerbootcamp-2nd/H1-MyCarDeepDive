import { AdditionQuestionBudgetProps } from '@/global/type';

function AdditionQuestionBudgetRange({
  budget,
  myLifeStyleHandler,
}: AdditionQuestionBudgetProps) {
  const price = {
    lowestPrice: 4200,
    highestPrice: 6900,
  };
  const { lowestPrice, highestPrice } = price;
  const unit = '만원';
  const rangeUnit = 300;

  return (
    <>
      <p className='mt-[38px] mb-[34px] font-h2-medium text-grey-50'>
        <span className='text-[24px] leading-[26px] tracking-[-0.2px]'>
          {lowestPrice.toLocaleString('en-US')}
        </span>
        <span className='font-h5-regular'>
          <span className='text-[24px] leading-[26px] tracking-[-0.2px]'>
            {unit}
          </span>
          <span className='text-[22px] leading-[26px] tracking-[-0.2px] mx-2'>
            ~
          </span>
        </span>{' '}
        <span className='font-h2-medium'>
          <span className='text-[24px] leading-[26px] tracking-[-0.2px]'>
            {(+budget).toLocaleString('en-US')}
          </span>
        </span>
        <span className='font-h5-regular'>
          <span className='text-[24px] leading-[26px] tracking-[-0.2px]'>
            {unit}
          </span>
        </span>
      </p>

      <input
        className='w-full mb-[14px] slider'
        type='range'
        min={lowestPrice}
        max={highestPrice}
        step={rangeUnit}
        name={'budget'}
        value={budget}
        onChange={myLifeStyleHandler}
      />

      <div className='flex justify-between font-body4-regular text-grey-400 mb-[52px]'>
        <p>{`${lowestPrice} ${unit}`}</p>
        <p>{`${highestPrice} ${unit}`}</p>
      </div>
    </>
  );
}

export default AdditionQuestionBudgetRange;
