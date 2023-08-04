import { RadioProps } from '../../../global/type';

function RadioUnselected({ name, value, onChangeHandler }: RadioProps) {
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
        <div className='flex items-center justify-center flex-shrink-0 gap-[16px] w-[298px] h-[56px] py-px-[20px] px-px-[12px] rounded-[6px] bg-grey-800 cursor-pointer transition-all duration-150 ease-in  hover:ring hover:ring-grey-800'>
          <div className='w-[270px] h-[24px] flex items-center justify-between '>
            <span className='text-grey-500 font-body2-medium'>{value}</span>
          </div>
        </div>
      </label>
    </>
  );
}

export default RadioUnselected;
