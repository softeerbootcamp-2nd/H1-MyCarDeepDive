import { useState } from 'react';
import CompareModal from '../CompareModal';

function CompareButton() {
  const [showCompareModal, setCompareModal] = useState(false);

  return (
    <>
      <button
        className='w-[65px] h-[30px] justify-center items-center gap-[10px] inline-flex rounded-[20px] border border-grey-700 font-caption1-regular text-grey-0 focus:outline-none'
        onClick={() => setCompareModal(true)}
      >
        <span className='leading-[22px] tracking-[-0.2px]'>비교하기</span>
      </button>
      <CompareModal
        showModal={showCompareModal}
        setShowModal={setCompareModal}
      />
    </>
  );
}

export default CompareButton;
