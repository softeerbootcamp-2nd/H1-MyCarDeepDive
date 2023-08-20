import checkCircle from '@/assets/icon/check-circle.svg';

interface Props {
  name: string;
  value: string;
  isLong?: boolean;
  onChangeHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

function RadioSelected({ name, value, isLong, onChangeHandler }: Props) {
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
          className={`flex items-center justify-center flex-shrink-0 gap-4 ${
            isLong === false ? 'w-[298px]' : 'w-[608px]'
          } h-14 rounded-md bg-grey-1000 border-[1.5px] border-primary cursor-pointer`}
        >
          <div className='py-5 px-3 w-full h-6 flex items-center justify-between'>
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
