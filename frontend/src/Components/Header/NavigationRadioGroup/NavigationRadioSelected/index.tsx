import { NavigationRadioProps } from '@/global/type';

function NavigationRadioSelected({
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
        <p className='text-primary font-h4-medium'>
          <span className='text-[14px] flex items-center justify-center '>
            {' '}
            {index + 1} {name}
          </span>
        </p>
      </label>
      <p
        className='font-body4-regular text-grey-400 flex items-center justify-center'
        style={{
          display: '-webkit-box',
          WebkitBoxOrient: 'vertical',
          WebkitLineClamp: 1,
          overflow: 'hidden',
          textOverflow: 'ellipsis',
          maxWidth: '238px',
        }}
      >
        {value}
      </p>
    </>
  );
}

export default NavigationRadioSelected;
