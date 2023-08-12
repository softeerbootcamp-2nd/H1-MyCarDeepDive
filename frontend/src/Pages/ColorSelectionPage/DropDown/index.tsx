import DownArrow from '@/assets/icon/down-arrow.svg';

function DropDown({ phrase }: { phrase: string }) {
  return (
    <p className='h-11 border border-primary rounded flex items-center justify-between pl-4 pr-3 font-body4-medium text-primary mb-8'>
      {phrase}
      <img src={DownArrow} alt='' />
    </p>
  );
}

export default DropDown;
