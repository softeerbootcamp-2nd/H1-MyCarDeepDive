import QuestionMarkImg from '@/assets/icon/question-mark.svg';
import { useState } from 'react';
import InformationModal from '../InformationModal';

function Guide() {
  const [showModal, setShowModal] = useState(false);

  return (
    <>
      <button
        className='flex mb-4 gap-[2px] focus:outline-none'
        onClick={() => setShowModal(true)}
      >
        <img src={QuestionMarkImg} alt='물음표' className='my-auto' />
        <p className='font-body4-medium'>
          <span className='leading-4 tracking-[-0.07px] text-secondary text-right underline underline-offset-[3px] cursor-pointer'>
            고르기 어렵다면?
          </span>
        </p>
      </button>
      <InformationModal showModal={showModal} setShowModal={setShowModal} />
    </>
  );
}

export default Guide;
