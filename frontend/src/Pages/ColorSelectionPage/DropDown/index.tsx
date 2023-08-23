import DownArrow from '@/assets/icon/down-arrow.svg';
import { useState } from 'react';
import ColorItems from '../ColorItems';
import ChangerModal from '../ChangerModal';
import { ColorType } from '@/global/type';

interface Props {
  phrase: string;
  data: {
    availableColor?: ColorType[] | undefined;
    unavailableColor?: ColorType[] | undefined;
    otherColorOfTrim?: ColorType[] | undefined;
  };
  clickHandler: {
    clickAvailableColorHandler: ({
      currentTarget,
    }: React.MouseEvent<HTMLButtonElement, MouseEvent>) => void;
  };
}

function DropDown({ phrase, data, clickHandler }: Props) {
  if (!data.otherColorOfTrim) return;
  const [showOtherColor, setShowOtherColor] = useState(false);
  const [wantedOtherColor, setWantedOtherColor] = useState<any>();
  const [showModal, setShowModal] = useState(false);

  // const otherColorClickHandler = ({
  //   currentTarget,
  // }: React.MouseEvent<HTMLButtonElement>) => {
  //   const dataObject = currentTarget.getAttribute('data-object');
  //   if (dataObject) {
  //     const colorInfo = JSON.parse(dataObject);
  //     setWantedOtherColor(colorInfo);
  //   }
  // };
  return (
    <>
      <div className='border border-primary rounded pl-4 pr-3 mb-8'>
        <button
          className='w-full flex items-center justify-between h-11'
          onClick={() => setShowOtherColor(!showOtherColor)}
        >
          <p className='font-body4-medium text-primary'>{phrase}</p>
          <img src={DownArrow} alt='down-arrow' className=' cursor-pointer' />
        </button>
        <div
          className={`overflow-hidden transition-all duration-1000 ${
            showOtherColor ? 'max-h-[1000px]' : 'max-h-0'
          }`}
        >
          <ColorItems
            data={data}
            clickHandler={clickHandler}
            setShowModal={setShowModal}
            colorType='other'
          />
          {showOtherColor && !data.otherColorOfTrim.length && (
            <p className='flex justify-center items-center py-10 font-body4-medium text-grey-500 '>
              다른 색상이 없습니다.
            </p>
          )}
        </div>
      </div>
      <ChangerModal
        wantedOtherColor={wantedOtherColor}
        showModal={showModal}
        setShowModal={setShowModal}
        clickHandler={clickHandler}
      />
    </>
  );
}
export default DropDown;
