import checkOptionIcon from '@/assets/icon/white-check-option.svg';

function SelectedButton() {
  return (
    <button className='bg-primary font-caption1-medium text-grey-1000 flex items-center gap-2 py-2 px-3 rounded-full'>
      <img src={checkOptionIcon} alt='check' />
      <span>선택</span>
    </button>
  );
}

export default SelectedButton;
