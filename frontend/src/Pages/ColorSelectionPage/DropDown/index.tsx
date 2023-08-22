import DownArrow from '@/assets/icon/down-arrow.svg';
import { useState } from 'react';
import ColorItems from '../ColorItems';
import ChangerModal from '../ChangerModal';
import { ColorType } from '@/global/type';

interface colorProps {
  name: string;
  imgUrl: string;
  price: number;
  trim?: string;
}

interface Props {
  phrase: string;
  data: ColorType[];
  otherColorChangeHandler: ({}: any) => void;
}

function DropDown({ phrase, data, otherColorChangeHandler }: Props) {
  const [showOtherColor, setShowOtherColor] = useState(false);
  const [wantedOtherColor, setWantedOtherColor] = useState<any>();
  const [showModal, setShowModal] = useState(false);

  const otherColorClickHandler = ({
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
            clickHandler={otherColorClickHandler}
            setShowModal={setShowModal}
            colorType='other'
          />
          {showOtherColor && !data.length && (
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
        otherColorChangeHandler={otherColorChangeHandler}
      />
    </>
  );
}
export default DropDown;
