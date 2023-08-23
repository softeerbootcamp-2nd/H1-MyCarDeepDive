import { useContext, useState } from 'react';
import situationOptionPlus from '@/assets/icon/situation-option-plus.svg';
import bubbleTriangle from '@/assets/icon/option-bubble-triangle.svg';
import bubbleMoreInfo from '@/assets/icon/bubble-more-info.svg';
import { priceToString, truncateText } from '@/utils';
import { OptionContext } from '@/context/OptionProvider';
import { SET_OPTIONID, SET_PACKAGE } from '@/context/OptionProvider/type';

interface Props {
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
  tag: string;
  additional_option_id: number;
  option_name: string;
  option_description: string;
  option_img_url: string;
  price: number;
  position_x: number;
  position_y: number;
}

function OptionInfo({
  setShowOptionModal,
  tag,
  additional_option_id,
  option_name,
  option_img_url,
  price,
  position_x,
  position_y,
}: Props) {
  const { optionDispatch } = useContext(OptionContext);
  const [bubbleClick, setBubbleClick] = useState(false);
  const [showBubble, setShowBubble] = useState(false);
  const [bubbleOpacity, setBubbleOpacity] = useState(false);
  const [bubbleTriangleTop, setBubbleTriangleTop] = useState(false);
  const [bubbleTimer, setBubbleTimer] = useState<NodeJS.Timeout | undefined>(
    undefined,
  );

  const clearTimer = () => {
    clearTimeout(bubbleTimer);
    setBubbleTimer(undefined);
  };

  const optionHoverHandler = (triangleTop: boolean) => {
    if (bubbleTimer) clearTimer();

    setShowBubble(true);
    setBubbleTriangleTop(triangleTop);
    setTimeout(() => {
      setBubbleOpacity(true);
    }, 10);
  };

  const optionOutHandler = () => {
    if (bubbleClick) return;

    setBubbleOpacity(false);
    setBubbleTimer(
      setTimeout(() => {
        setShowBubble(false);
      }, 710),
    );
  };

  const bubbleHoverHandler = () => {
    if (!bubbleTimer) return;

    clearTimer();
    setBubbleOpacity(true);
  };

  const bubbleOutHandler = () => {
    if (bubbleClick) return;

    optionOutHandler();
  };

  const showMoreInfo = () => {
    optionDispatch({
      type: SET_OPTIONID,
      optionId: additional_option_id || 0,
    });
    optionDispatch({
      type: SET_PACKAGE,
      packageOption: false,
    });

    setShowOptionModal(true);
  };

  return (
    <>
      <button
        className={`absolute w-7 h-7 hover:bg-secondary hover:bg-opacity-70 bg-opacity-70 flex justify-center items-center rounded-full ${
          bubbleOpacity ? 'bg-secondary' : 'bg-[#ACB8C8]'
        }`}
        style={{
          top: `${position_y}%`,
          left: `${position_x}%`,
        }}
        onMouseEnter={() => optionHoverHandler(position_y < 20)}
        onMouseLeave={optionOutHandler}
        onClick={() => setBubbleClick(bubbleClick => !bubbleClick)}
      >
        <img src={situationOptionPlus} alt='optionPlus' />
      </button>
      {showBubble && (
        <div
          className={`absolute -translate-x-[121px] w-[270px] h-24 rounded-lg bg-grey-1000 shadow-md cursor-pointer transition-opacity duration-700 ${
            bubbleOpacity ? 'opacity-100' : 'opacity-0'
          } ${position_y < 20 ? 'translate-y-11' : '-translate-y-28'}`}
          style={{
            top: `${position_y}%`,
            left: `${position_x}%`,
          }}
          onClick={showMoreInfo}
          onMouseEnter={bubbleHoverHandler}
          onMouseLeave={bubbleOutHandler}
        >
          <div className='w-full h-full relative py-3 pl-3 flex gap-2'>
            <img
              src={'https://' + option_img_url}
              alt={option_name}
              className='w-[72px] h-[72px] rounded'
            />
            <div className='flex flex-col gap-2 justify-between'>
              <div className='flex flex-col'>
                <span className='font-caption1-regular text-grey-400'>
                  {tag}
                </span>
                <span className='font-body3-medium text-grey-50'>
                  {truncateText(option_name, 10)}
                </span>
              </div>
              <div className='font-h4-medium text-grey-100'>
                {priceToString(price)} 원
              </div>
            </div>
            <img
              src={bubbleMoreInfo}
              alt='bubbleMoreInfo'
              className='absolute right-2 top-1/2 -translate-y-1/2'
            />

            {bubbleTriangleTop ? (
              <img
                src={bubbleTriangle}
                alt='bubbleTriangle'
                className='rotate-180 absolute top-0 left-1/2 -translate-x-[7px] -translate-y-[10px]'
              />
            ) : (
              <img
                src={bubbleTriangle}
                alt='bubbleTriangle'
                className='absolute bottom-0 left-1/2 -translate-x-[7px] translate-y-[10px]'
              />
            )}
          </div>
        </div>
      )}
    </>
  );
}

export default OptionInfo;
