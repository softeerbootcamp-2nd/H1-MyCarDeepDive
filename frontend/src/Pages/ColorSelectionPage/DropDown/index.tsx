import DownArrow from '@/assets/icon/down-arrow.svg';
import { useState } from 'react';
import ColorItems from '../ColorItems';
import ChangerModal from '../ChangerModal';

interface colorProps {
  name: string;
  chooseRate: number;
  url: string;
}

interface Props {
  phrase: string;
  data: colorProps[];
  changerClickHandler: React.Dispatch<
    React.SetStateAction<colorProps | undefined>
  >;
  setTrim: React.Dispatch<React.SetStateAction<string>>;
}

function DropDown({ phrase, data, changerClickHandler, setTrim }: Props) {
  const [showOtherColor, setShowOtherColor] = useState(false);
  const [wantedOtherColor, setWantedOtherColor] = useState({
    name: '',
    chooseRate: 0,
    url: '',
  });
  const [showModal, setShowModal] = useState(false);

  const otherColorHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => {
    const dataObject = currentTarget.getAttribute('data-object');
    if (dataObject) {
      const colorInfo = JSON.parse(dataObject);
      setWantedOtherColor(colorInfo);
    }
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
            <ColorItems
              data={data}
              clickHandler={otherColorHandler}
              setShowModal={setShowModal}
              colorType='other'
            />
          )}
          {showOtherColor && !data.length && (
            <p className='flex justify-center items-center py-10 font-body4-medium text-grey-500 '>
              다른 색상이 없습니다.
            </p>
          )}
        </div>
      </div>
      <ChangerModal
        wantedOtherColor={wantedOtherColor}
        changerClickHandler={changerClickHandler}
        showModal={showModal}
        setShowModal={setShowModal}
        setTrim={setTrim}
      />
    </>
  );
}
export default DropDown;
