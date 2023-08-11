import { ModalProps } from '@/global/type';
import Modal from '@/Components/Modal';
import CloseModal from '@/Components/Modal/CloseModal';
import ModalContentsWrapper from './ModalContentsWrapper';
import ContentsWrapper from './ContentsWrapper';
import Description from './Description';
import BottomButtons from './BottomButtons';

function RecommendAgainModal({ showModal, setShowModal }: ModalProps) {
  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <ModalContentsWrapper>
        <CloseModal />
        <ContentsWrapper>
          <Description />
          <BottomButtons />
        </ContentsWrapper>
      </ModalContentsWrapper>
    </Modal>
  );
}

export default RecommendAgainModal;
