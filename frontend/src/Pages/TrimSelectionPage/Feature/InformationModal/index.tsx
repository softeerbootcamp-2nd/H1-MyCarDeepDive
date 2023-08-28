import { useEffect, useRef, useState } from 'react';
import { engineData, bodyData, drivingSystemData } from '@/global/data';
import { ModalProps } from '@/global/type';
import Modal from '@/Components/Modal';
import CloseModal from '@/Components/Modal/CloseModal';
import NavBar from './NavBar';
import Item from './Item';

function InformationModal({ showModal, setShowModal }: ModalProps) {
  const scrollRef = useRef<HTMLDivElement>(null);
  const [offsetX, setOffsetX] = useState(0);
  const [category, setCategory] = useState('엔진');
  const categoryClickHandler = (
    e: React.MouseEvent<HTMLButtonElement, MouseEvent>,
  ) => {
    setCategory(e.currentTarget.innerText);
    setOffsetX(e.currentTarget.offsetLeft);
  };

  useEffect(() => {
    if (!scrollRef.current) return;

    const newPosition = 800 * (offsetX / 96);

    scrollRef.current.scrollTo({
      left: newPosition,
      behavior: 'smooth',
    });
  }, [offsetX]);

  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <div className='w-[800px] h-[535px] absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-grey-1000 rounded-xl'>
        <div className='w-full h-[70px] mb-8 relative'>
          <NavBar
            offsetX={offsetX}
            category={category}
            categoryClickHandler={categoryClickHandler}
          />
          <CloseModal />
        </div>
        <div
          className='w-full flex overflow-x-auto noScrollBar'
          ref={scrollRef}
        >
          <div className='w-full overflow-hidden flex-shrink-0'>
            {engineData.map(item => (
              <Item {...item} key={item.name} />
            ))}
          </div>
          <div className='w-full overflow-hidden flex-shrink-0'>
            {bodyData.map(item => (
              <Item {...item} key={item.name} />
            ))}
          </div>
          <div className='w-full overflow-hidden flex-shrink-0'>
            {drivingSystemData.map(item => (
              <Item {...item} key={item.name} />
            ))}
          </div>
        </div>
      </div>
    </Modal>
  );
}

export default InformationModal;
