import DownArrow from '@/assets/icon/down-arrow.svg';
import { useState } from 'react';
import ColorRadio from '../ColorRadio';
import ChangerModal from '../ChangerModal';

function DropDown({
  phrase,
  data,
  changerClickHandler,
}: {
  phrase: string;
  data: {
    name: string;
    trim: string;
    chooseRate: number;
    url: string;
  }[];
  changerClickHandler: React.Dispatch<React.SetStateAction<string>>;
}) {
  const [showOtherColor, setShowOtherColor] = useState(false);
  const [wantedOtherColor, setWantedOtherColor] = useState('');
  const [showModal, setShowModal] = useState(false);

  const otherColorHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLInputElement>) => {
    setWantedOtherColor(currentTarget.value);
  };

  return (
    <>
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
        <div
          className={`max-h-0 overflow-hidden transition-all duration-1000 ${
            showOtherColor ? 'max-h-[1000px]' : ''
          }`}
        >
          {showOtherColor && (
            <ColorRadio
              data={data}
              clickHandler={otherColorHandler}
              setShowModal={setShowModal}
              colorType='other'
            />
          )}
        </div>
      </div>
      <ChangerModal
        wantedOtherColor={wantedOtherColor}
        changerClickHandler={changerClickHandler}
        showModal={showModal}
        setShowModal={setShowModal}
      />
    </>
  );
}

export default DropDown;
