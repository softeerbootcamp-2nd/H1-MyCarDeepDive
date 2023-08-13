import { NavigationRadioProps } from '@/global/type';
import { useNavigate } from 'react-router-dom';

function NavigationRadioUnselected({
  name,
  index,
  value,
  address,
  onChangeHandler,
}: NavigationRadioProps) {
  const navigation = useNavigate();
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
      <label
        htmlFor={name}
        className='cursor-pointer'
        onClick={() => navigation(`/select/${address}`)}
      >
        <p className='text-grey-600 font-h5-regular'>
          <span className='text-[14px] flex items-center justify-center'>
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

export default NavigationRadioUnselected;