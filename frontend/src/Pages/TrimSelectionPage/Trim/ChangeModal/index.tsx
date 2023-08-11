import { TrimChangeModalProps } from '@/global/type';
import Modal from '@/Components/Modal';
import CloseModal from '@/Components/Modal/CloseModal';
import ModalContentsWrapper from './ModalContentsWrapper';
import Title from './Title';
import UnlockColor from './UnlockColor';
import UnlockOption from './UnlockOption';
import Buttons from './Buttons';
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

function ChangeModal({
  showModal,
  setShowModal,
  mycarTrimHandler,
}: TrimChangeModalProps) {
  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <ModalContentsWrapper>
        <CloseModal />
        <div className='mt-6 mx-8'>
          <Title />
          <UnlockColor unlockList={UnlockColorData} />
          <UnlockOption unlockList={UnlockOptionData} />
          <Buttons mycarTrimHandler={mycarTrimHandler} />
        </div>
      </ModalContentsWrapper>
    </Modal>
  );
}

export default ChangeModal;
