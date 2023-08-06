import { AdditionQuestionBudgetProps } from '@/global/type';

function AdditionQuestionBudgetRange({
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
            {highestPrice.toLocaleString('en-US')}
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
        list='trickmarks'
        type='range'
        min={lowestPrice}
        max={highestPrice}
        step={rangeUnit}
        name={'budget'}
        onChange={myLifeStyleHandler}
      />
      <datalist id='trickmarks'>
        <option value='4200' />
        <option value='4500' />
        <option value='4800' />
        <option value='5100' />
        <option value='5400' />
        <option value='5700' />
        <option value='6000' />
        <option value='6300' />
        <option value='6600' />
        <option value='6900' />
      </datalist>

      <div className='flex justify-between font-body4-regular text-grey-400 mb-[52px]'>
        <p>{`${lowestPrice} ${unit}`}</p>
        <p>{`${highestPrice} ${unit}`}</p>
      </div>
    </>
  );
}

export default AdditionQuestionBudgetRange;
