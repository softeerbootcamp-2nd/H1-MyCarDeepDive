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
  const currentBudget = `${
    ((Number(budget) - lowestPrice) / (highestPrice - lowestPrice)) * 100
  }%`;

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

      <div className='w-full h-6 relative flex items-center mb-[6px]'>
        <div className='w-6 h-6 border border-grey-500 bg-grey-1000 rounded-full absolute top-0 left-0 z-10' />
        <div className='w-full h-2 rounded-full bg-grey-700 relative'>
          <div
            className='h-2 rounded-full bg-secondary absolute top-0 left-0'
            style={{ width: currentBudget }}
          />
        </div>
        <input
          className='absolute w-full h-6 bg-transparent slider z-20 top-0 left-0'
          type='range'
          min={lowestPrice}
          max={highestPrice}
          step={rangeUnit}
          name={'budget'}
          value={budget}
          onChange={myLifeStyleHandler}
        />
      </div>
      <div className='flex justify-between font-body4-regular text-grey-400 mb-[52px]'>
        <p>{`${lowestPrice} ${unit}`}</p>
        <p>{`${highestPrice} ${unit}`}</p>
      </div>
    </>
  );
}

export default AdditionQuestionBudgetRange;
