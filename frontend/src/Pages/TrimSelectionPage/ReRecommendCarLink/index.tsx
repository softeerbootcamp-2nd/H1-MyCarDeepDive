import { useState } from 'react';
import RecommendAgainModal from '../RecommendAgainModal';
import ReRecommendIcon from '@/assets/icon/re-recommend-icon.svg';

function ReRecommendCardLink() {
  const [showModal, setShowModal] = useState(false);

  return (
    <>
      <button
        className='absolute top-4 left-[15%] bg-opacity-80 bg-white z-20 py-[7px] px-[14px] rounded-[20px] text-secondary flex justify-center items-center gap-1 focus:outline-none'
        onClick={() => setShowModal(true)}
      >
        <img src={ReRecommendIcon} alt='' className='w-4 h-4' />
        <span className='align-middle font-body4-medium'>
          <span className='leading-[100%] tracking-normal'>다시 추천받기</span>
        </span>
      </button>
      <RecommendAgainModal showModal={showModal} setShowModal={setShowModal} />
    </>
  );
}

export default ReRecommendCardLink;
