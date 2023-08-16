import checkOptionPrimaryIcon from '@/assets/icon/primary-check-option.svg';

function UnSelectedButton() {
  return (
    <button className='bg-grey-1000 font-caption1-medium text-primary border border-primary flex items-center gap-2 py-1.5 px-3 rounded-full'>
      <img src={checkOptionPrimaryIcon} alt='check' />
      <span>선택</span>
    </button>
  );
}

export default UnSelectedButton;
