import { ModalProps } from '@/global/type';
import Modal from '@/Components/Modal';
import CloseModal from '@/Components/Modal/CloseModal';
import ModalContentsWrapper from './ModalContentsWrapper';
import ContentsWrapper from './ContentsWrapper';
import Description from './Description';
import Buttons from './Buttons';

function ReRecommendModal({ showModal, setShowModal }: ModalProps) {
  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <ModalContentsWrapper>
        <CloseModal />
        <ContentsWrapper>
          <Description />
          <Buttons />
        </ContentsWrapper>
      </ModalContentsWrapper>
    </Modal>
  );
}

export default ReRecommendModal;
