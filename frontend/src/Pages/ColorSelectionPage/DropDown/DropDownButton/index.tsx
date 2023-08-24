import DownArrow from '@/assets/icon/down-arrow.svg';

interface Props {
  setShowOtherColor: React.Dispatch<React.SetStateAction<boolean>>;
  showOtherColor: boolean;
  phrase: string;
}

function DropDownButton({ setShowOtherColor, showOtherColor, phrase }: Props) {
  return (
    <button
      className='w-full flex items-center justify-between h-11'
      onClick={() => setShowOtherColor(!showOtherColor)}
    >
      <p className='font-body4-medium text-primary'>{phrase}</p>
      <img src={DownArrow} alt='down-arrow' className=' cursor-pointer' />
    </button>
  );
}

export default DropDownButton;
