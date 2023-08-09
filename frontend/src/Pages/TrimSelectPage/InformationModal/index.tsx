import { useState } from 'react';
import { ModalProps } from '@/global/type';
import Modal from '@/Components/Modal';
import CloseModal from '@/Components/Modal/CloseModal';
import NavBar from './NavBar';
import InformationItem from './InformationItem';
import diesel from '@/assets/image/diesel.png';
import gasoline from '@/assets/image/gasoline.png';

const engineData = [
  {
    image: diesel,
    name: '디젤 2.2',
    description:
      '높은 토크로 파워풀한 드라이빙이 가능하며, 차급대비 연비 효율이 우수합니다.',
    detail: [
      {
        key: '최고출력',
        value: '202/3,800 PS/rpm',
      },
      {
        key: '최대토크',
        value: '45.0/1,750~2,750 kgf-m/rpm',
      },
    ],
  },
  {
    image: gasoline,
    name: '가솔린 3.8',
    description:
      '고마력의 우수한 가속 성능을 확보하여, 넉넉하고 안정감 있는 주행이 가능합니다엔진의 진동이 적어 편안하고 조용한 드라이빙 감성을 제공합니다.',
    detail: [
      {
        key: '최고출력',
        value: '295/6,000 PS/rpm',
      },
      {
        key: '최대토크',
        value: '36.2/5,200 kgf-m/rpm',
      },
    ],
  },
];

function InformationModal({ showModal, setShowModal }: ModalProps) {
  const [offsetX, setOffsetX] = useState(0);
  const [category, setCategory] = useState('엔진');
  const categoryClickHandler = (
    e: React.MouseEvent<HTMLButtonElement, MouseEvent>,
  ) => {
    setCategory(e.currentTarget.innerText);
    setOffsetX(e.currentTarget.offsetLeft);
  };

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
        {engineData.map(item => (
          <InformationItem {...item} key={item.name} />
        ))}
      </div>
    </Modal>
  );
}

export default InformationModal;
