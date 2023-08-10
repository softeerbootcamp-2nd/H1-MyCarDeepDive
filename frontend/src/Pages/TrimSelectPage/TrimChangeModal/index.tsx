import { ModalProps } from '@/global/type';
import Modal from '@/Components/Modal';
import CloseModal from '@/Components/Modal/CloseModal';
import ModalContentsWrapper from './ModalContentsWrapper';
import ModalTitle from './ModalTitle';
import UnlockColor from './UnlockColor';
import UnlockOption from './UnlockOption';
import BottomButton from './BottomButton';
import interiorArtificialLeatherBlack from '@/assets/image/interior-artificial-leather-black.png';
import parkingAidSystem from '@/assets/image/parking-aid-system.png';
import comport2Square from '@/assets/image/comport2-square.png';

const UnlockColorData = [
  { image: interiorArtificialLeatherBlack, name: '내장 - 인조 가죽 (블랙)' },
];

const UnlockOptionData = [
  { image: parkingAidSystem, name: '주차보조 시스템' },
  { image: comport2Square, name: '컴포트 II' },
];

function TrimChangeModal({ showModal, setShowModal }: ModalProps) {
  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <ModalContentsWrapper>
        <CloseModal />
        <div className='mt-6 mx-8'>
          <ModalTitle />
          <UnlockColor unlockList={UnlockColorData} />
          <UnlockOption unlockList={UnlockOptionData} />
          <BottomButton />
        </div>
      </ModalContentsWrapper>
    </Modal>
  );
}

export default TrimChangeModal;
