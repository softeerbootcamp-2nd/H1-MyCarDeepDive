import optionModalPage from '@/assets/icon/option-modal-page.svg';

interface PageButtonsProps {
  movePage: (page: number) => void;
}

function PageButtons({ movePage }: PageButtonsProps) {
  return (
    <div className='w-[1037px] h-14 absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 flex justify-between z-40'>
      <button
        className='w-14 h-14 bg-grey-1000 bg-opacity-20 rounded flex justify-center items-center z-40'
        onClick={() => movePage(-1)}
      >
        <img src={optionModalPage} alt='next' className='rotate-180' />
      </button>
      <button
        className='w-14 h-14 bg-grey-1000 bg-opacity-20 rounded flex justify-center items-center z-40'
        onClick={() => movePage(1)}
      >
        <img src={optionModalPage} alt='next' />
      </button>
    </div>
  );
}

export default PageButtons;
