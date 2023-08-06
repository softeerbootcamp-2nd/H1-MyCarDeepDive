import { RadioProps } from '@/global/type';

function RadioUnselected({ name, value, isLong, onChangeHandler }: RadioProps) {
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
        <div
          className={`flex items-center justify-center flex-shrink-0 gap-[16px] ${
            isLong === false ? 'w-[298px]' : 'w-[608px]'
          } h-[56px] rounded-[6px] bg-grey-800 cursor-pointer transition-all duration-200 ease-in hover:ring hover:ring-grey-800`}
        >
          <div className='py-[20px] px-[12px] w-full h-[24px] flex items-center justify-between '>
            <span className=' text-grey-500 font-body2-medium'>{value}</span>
          </div>
        </div>
      </label>
    </>
  );
}

export default RadioUnselected;
