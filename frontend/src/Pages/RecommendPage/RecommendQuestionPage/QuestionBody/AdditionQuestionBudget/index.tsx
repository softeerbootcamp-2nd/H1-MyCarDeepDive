import { AdditionQuestionBudgetProps } from '@/global/type';

function AdditionQuestionBudgetRange({
  myLifeStyleHandler,
}: AdditionQuestionBudgetProps) {
  return (
    <>
      <p className='mt-[38px] mb-[34px] font-h2-medium text-grey-50'>
        <span className='text-[24px] leading-[26px] tracking-[-0.2px]'>
          4,200
        </span>
        <span className='font-h5-regular'>
          <span className='text-[24px] leading-[26px] tracking-[-0.2px]'>
            만원
          </span>
          <span className='text-[22px] leading-[26px] tracking-[-0.2px] mx-2'>
            ~
          </span>
        </span>{' '}
        <span className='font-h2-medium'>
          <span className='text-[24px] leading-[26px] tracking-[-0.2px]'>
            6,900
          </span>
        </span>
        <span className='font-h5-regular'>
          <span className='text-[24px] leading-[26px] tracking-[-0.2px]'>
            만원
          </span>
        </span>
      </p>

      <input
        className='w-full mb-[14px] slider'
        list='trickmarks'
        type='range'
        min={'4200'}
        max={'6900'}
        step={'300'}
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
        <p>4200 만원</p>
        <p>6900 만원</p>
      </div>
    </>
  );
}

export default AdditionQuestionBudgetRange;
