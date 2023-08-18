import { trimCompareData } from '@/global/data';
import { ModalProps } from '@/global/type';
import Modal from '@/Components/Modal';
import ModalContainer from './ModalContainer';
import CompareModalHeader from './CompareModalHeader';
import TrimWrapper from './TrimWrapper';
import Trim from './Trim';

function CompareModal({ showModal, setShowModal }: ModalProps) {
  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <ModalContainer>
        <CompareModalHeader />
        <TrimWrapper>
          {trimCompareData.map(trim => (
            <Trim {...trim} key={trim.trimName} />
          ))}
        </TrimWrapper>
      </ModalContainer>
    </Modal>
  );
}

export default CompareModal;
