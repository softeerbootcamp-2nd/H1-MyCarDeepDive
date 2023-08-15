import { useState } from 'react';
import situationOptionPlus from '@/assets/icon/situation-option-plus.svg';
import bubbleTriangle from '@/assets/icon/option-bubble-triangle.svg';
import bubbleSmartSense from '@/assets/image/option-bubble-smartsense.png';
import bubbleMoreInfo from '@/assets/icon/bubble-more-info.svg';

interface Props {
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
}

function OptionInfo({ setShowOptionModal }: Props) {
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

  const bubbleClickHandler = () => {
    setShowOptionModal(true);
    setBubbleClick(true);
  };

  return (
    <>
      <button
        className={`absolute top-[167px] left-[236px] w-7 h-7 hover:bg-secondary hover:bg-opacity-70 bg-opacity-70 flex justify-center items-center rounded-full ${
          bubbleOpacity ? 'bg-secondary' : 'bg-[#ACB8C8]'
        }`}
        onMouseEnter={() => optionHoverHandler(false)}
        onMouseLeave={optionOutHandler}
        onClick={() => setBubbleClick(bubbleClick => !bubbleClick)}
      >
        <img src={situationOptionPlus} alt='optionPlus' />
      </button>
      {showBubble && (
        <div
          className={`absolute top-[167px] left-[236px] -translate-x-[121px] -translate-y-28 w-[270px] h-24 rounded-lg bg-grey-1000 shadow-md cursor-pointer transition-opacity duration-700 ${
            bubbleOpacity ? 'opacity-100' : 'opacity-0'
          }`}
          onClick={bubbleClickHandler}
          onMouseEnter={bubbleHoverHandler}
          onMouseLeave={bubbleOutHandler}
        >
          <div className='w-full h-full relative py-3 pl-3 flex gap-2'>
            <img src={bubbleSmartSense} alt='bubbleSmartSense' />
            <div className='flex flex-col gap-2 justify-between'>
              <div className='flex flex-col'>
                <span className='font-caption1-regular text-grey-400'>
                  주행안전
                </span>
                <span className='font-body3-medium text-grey-50'>
                  현대 스마트 센스 I
                </span>
              </div>
              <div className='font-h4-medium text-grey-100'>790,000 원</div>
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
