import { truncateText } from '@/utils';
import { useLocation, useNavigate } from 'react-router-dom';

export interface Props {
  name: string;
  index: number;
  value: string;
  address: 'trim' | 'color' | 'option';
}

function Item({ name, index, value, address }: Props) {
  const navigation = useNavigate();
  const location = useLocation();
  return (
    <div
      className={`flex gap-3 ${
        index === 1 ? 'w-40' : index === 2 ? 'w-48' : ''
      }`}
    >
      <button onClick={() => navigation(`/select/${address}`)}>
        <p
          className={`${
            location.pathname === `/select/${address}`
              ? 'text-primary '
              : 'text-grey-600 '
          } font-h4-medium`}
        >
          <span className='text-[14px] flex items-center justify-center '>
            {index} {name}
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
        {truncateText(value, index === 1 ? 30 : index === 2 ? 12 : 40)}
      </p>
    </div>
  );
}

export default Item;
