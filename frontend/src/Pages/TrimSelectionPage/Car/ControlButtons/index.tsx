import exterial from '@/assets/icon/exterial.svg';
import interial from '@/assets/icon/interial.svg';
import rotation360 from '@/assets/icon/rotation360.svg';

interface ControlButtonsProps {
  rotation: boolean;
  setRotation: React.Dispatch<React.SetStateAction<boolean>>;
}

function ControlButtons({ rotation, setRotation }: ControlButtonsProps) {
  return (
    <div className='absolute top-24 left-[10%] flex flex-col gap-2 z-40'>
      <button className='w-[52px] h-[52px] shadow-md bg-grey-1000 rounded px-2.5 flex justify-between items-center hover:w-24 group transition-width duration-300'>
        <img src={exterial} alt='exterial' />
        <span className='font-caption1-medium text-grey-0 mr-2 opacity-0 group-hover:opacity-100 transition-opacity duration-1000'>
          외장
        </span>
      </button>
      <button className='w-[52px] h-[52px] shadow-md bg-grey-1000 rounded px-2.5 flex justify-between items-center hover:w-24 group transition-width duration-300'>
        <img src={interial} alt='interial' />
        <span className='font-caption1-medium text-grey-0 mr-2 opacity-0 group-hover:opacity-100 transition-opacity duration-1000'>
          내장
        </span>
      </button>
      <button
        className='w-[52px] h-[52px] shadow-md bg-grey-1000 rounded px-2.5 flex justify-between items-center hover:w-24 group transition-width duration-300'
        onClick={() => setRotation(!rotation)}
      >
        <img src={rotation360} alt='ratation' />
        <span className='font-caption1-medium text-grey-0 mr-2 opacity-0 group-hover:opacity-100 transition-opacity duration-1000'>
          회전
        </span>
      </button>
    </div>
  );
}

export default ControlButtons;
