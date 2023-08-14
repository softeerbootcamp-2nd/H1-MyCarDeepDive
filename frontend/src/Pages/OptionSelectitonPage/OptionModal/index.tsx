import Modal from '@/Components/Modal';
import React, { useRef } from 'react';
import PageButtons from './PageButtons';
import OptionCard from './OptionCard';

interface OptionModalProps {
  showOptionModal: boolean;
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
  OptionCardData: {
    tag: string[];
    image: string;
    optionName: string;
    detailOptionName: string;
    price: string;
    description: string;
    detailOptions: string[];
  }[];
}

function OptionModal({
  showOptionModal,
  setShowOptionModal,
  OptionCardData,
}: OptionModalProps) {
  const scrollRef = useRef<HTMLDivElement>(null);

  const movePage = (direction: number) => {
    if (scrollRef.current !== null && scrollRef.current !== undefined) {
      const scrollLeft = scrollRef.current.scrollLeft;
      const newPosition = scrollLeft + 980 * direction;

      scrollRef.current.scrollTo({
        left: newPosition,
        behavior: 'smooth',
      });
    }
  };

  const jumpPage = (step: number) => {
    if (scrollRef.current !== null && scrollRef.current !== undefined) {
      const newPosition = 980 * step;

      scrollRef.current.scrollTo({
        left: newPosition,
        behavior: 'smooth',
      });
    }
  };

  return (
    <Modal showModal={showOptionModal} setShowModal={setShowOptionModal}>
      {OptionCardData.length > 1 && <PageButtons movePage={movePage} />}
      <div
        className='w-full h-[440px] absolute top-1/2 left-0 transform -translate-y-1/2 flex gap-20 overflow-x-auto noScrollBar'
        ref={scrollRef}
      >
        {OptionCardData.map((item, idx) => (
          <OptionCard
            {...item}
            index={idx}
            length={OptionCardData.length}
            key={idx}
            jumpPage={jumpPage}
            isSet={OptionCardData.length > 1}
          />
        ))}
      </div>
    </Modal>
  );
}

export default OptionModal;
