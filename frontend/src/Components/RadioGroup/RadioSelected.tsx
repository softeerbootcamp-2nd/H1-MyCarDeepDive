import { RadioProps } from '@/global/type';
import checkCircle from '@/assets/icon/check-circle.svg';

function RadioSelected({ name, value, onChangeHandler }: RadioProps) {
  return (
    <>
      <input
        type='radio'
        id={value}
        name={name}
        value={value}
        className='hidden'
        onChange={onChangeHandler}
      />
      <label htmlFor={value}>
        <div className='flex items-center justify-center flex-shrink-0 gap-[16px] w-[298px] h-[56px] py-px-[20px] px-px-[12px] rounded-[6px] bg-grey-1000 border-[1.5px] border-primary cursor-pointer'>
          <div className='w-[270px] h-[24px] flex items-center justify-between'>
            <span className='text-primary font-body2-bold'>
              <span className='leading-[22px]'>{value}</span>
            </span>
            <img src={checkCircle} alt='checkCircle' />
          </div>
        </div>
      </label>
    </>
  );
}

export default RadioSelected;
