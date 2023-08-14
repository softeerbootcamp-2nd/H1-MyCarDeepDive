import { NavigationRadioProps } from '@/global/type';
import { useLocation, useNavigate } from 'react-router-dom';

function Item({ name, index, value, address }: NavigationRadioProps) {
  const navigation = useNavigate();
  const location = useLocation();

  return (
    <>
      <button onClick={() => navigation(`/select/${address}`)}>
        <p
          className={`${
            location.pathname === `/select/${address}`
              ? 'text-primary '
              : 'text-grey-600 '
          } font-h4-medium`}
        >
          <span className='text-[14px] flex items-center justify-center '>
            {index + 1} {name}
          </span>
        </p>
      </button>
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

export default Item;
