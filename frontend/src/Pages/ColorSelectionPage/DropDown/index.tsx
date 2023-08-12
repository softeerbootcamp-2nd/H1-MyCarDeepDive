import DownArrow from '@/assets/icon/down-arrow.svg';
import { useState } from 'react';
import ColorRadio from '../ColorRadio';

function DropDown({
  phrase,
  data,
}: {
  phrase: string;
  data: {
    name: string;
    trim?: string;
    chooseRate: number;
    url: string;
  }[];
}) {
  const [showOtherColor, setShowOtherColor] = useState(false);
  const [selectedOtherColor, setSelectedOtherColor] = useState('');

  const otherColorHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    setSelectedOtherColor(target.value);
  };

  return (
    <div className='border border-primary rounded pl-4 pr-3 mb-8'>
      <div className='flex items-center justify-between h-11'>
        <p className='font-body4-medium text-primary'>{phrase}</p>
        <img
          src={DownArrow}
          alt='down-arrow'
          className=' cursor-pointer'
          onClick={() => setShowOtherColor(!showOtherColor)}
        />
      </div>

      <div className=''>
        {showOtherColor && (
          <ColorRadio
            data={data}
            radioTarget={selectedOtherColor}
            radioHandler={otherColorHandler}
            type='other'
          />
        )}
      </div>
    </div>
  );
}

export default DropDown;
