import exterial from '@/assets/icon/exterial.svg';
import interial from '@/assets/icon/interial.svg';
import rotation360 from '@/assets/icon/rotation360.svg';
import React from 'react';

interface ControlButtonsProps {
  rotation: boolean;
  setRotation: React.Dispatch<React.SetStateAction<boolean>>;
  view: string;
  setView?: React.Dispatch<React.SetStateAction<string>>;
}

function ControlButtons({
  rotation,
  setRotation,
  view,
  setView,
}: ControlButtonsProps) {
  return (
    <div className='absolute top-24 left-[10%] flex flex-col gap-2 z-40'>
      <button
        onClick={() => setView?.('exterial')}
        className={`${
          view === 'exterial' ? 'w-24' : 'w-[52px]'
        } w-24 h-[52px] shadow-md bg-grey-1000 bg-opacity-80 rounded px-2.5 flex justify-between items-center hover:w-24 group transition-all duration-300 overflow-hidden whitespace-nowrap`}
      >
        <img src={exterial} alt='exterial' />
        <span className='font-caption1-medium text-grey-0 mr-2 group-hover:opacity-100 transition-opacity duration-1000 overflow-hidden'>
          외장
        </span>
      </button>
      <button
        onClick={() => setView?.('interial')}
        className={`${
          view === 'interial' ? 'w-24' : 'w-[52px]'
        } w-24 h-[52px] shadow-md bg-grey-1000 bg-opacity-80 rounded px-2.5 flex justify-between items-center hover:w-24 group transition-all duration-300 overflow-hidden whitespace-nowrap`}
      >
        <img src={interial} alt='interial' />
        <span className='font-caption1-medium text-grey-0 mr-2 group-hover:opacity-100 transition-opacity duration-1000 overflow-hidden'>
          내장
        </span>
      </button>

      {view === 'exterial' && (
        <button
          onClick={() => {
            setRotation(!rotation);
          }}
          className={`${
            rotation ? 'w-24' : 'w-[52px]'
          } w-24 h-[52px] shadow-md bg-grey-1000 bg-opacity-80 rounded px-2.5 flex justify-between items-center hover:w-24 group transition-all duration-300 overflow-hidden whitespace-nowrap`}
        >
          <img src={rotation360} alt='ratation' />
          <span className='font-caption1-medium text-grey-0 mr-2 group-hover:opacity-100 transition-opacity duration-1000 overflow-hidden'>
            회전
          </span>
        </button>
      )}
    </div>
  );
}

export default ControlButtons;
