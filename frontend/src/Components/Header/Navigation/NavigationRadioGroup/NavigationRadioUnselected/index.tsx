import { NavigationRadioProps } from '@/global/type';

function NavigationRadioUnselected({
  name,
  index,
  value,
  onChangeHandler,
}: NavigationRadioProps) {
  return (
    <>
      <input
        type='radio'
        id={name}
        name='property'
        value={name}
        className='hidden'
        onChange={onChangeHandler}
      />{' '}
      <label htmlFor={name} className='cursor-pointer'>
        <p className='text-grey-600 font-h5-regular'>
          <span className='text-[14px] flex items-center justify-center'>
            {' '}
            {index + 1} {name}
          </span>
        </p>
      </label>
      <p className='font-body4-regular text-grey-400 flex items-center justify-center'>
        {value}
      </p>
    </>
  );
}

export default NavigationRadioUnselected;