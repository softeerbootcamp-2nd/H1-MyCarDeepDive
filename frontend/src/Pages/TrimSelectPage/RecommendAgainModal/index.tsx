import { ModalProps } from '@/global/type';
import Modal from '@/Components/Modal';
import ModalContentsWrapper from './ModalContentsWrapper';
import CloseButton from './CloseButton';
import ContentsWrapper from './ContentsWrapper';
import Description from './Description';
import BottomButtons from './BottomButtons';

function RecommendAgainModal({ showModal, setShowModal }: ModalProps) {
  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <ModalContentsWrapper>
        <CloseButton />
        <ContentsWrapper>
          <Description />
          <BottomButtons />
        </ContentsWrapper>
      </ModalContentsWrapper>
    </Modal>
  );
}

export default RecommendAgainModal;
