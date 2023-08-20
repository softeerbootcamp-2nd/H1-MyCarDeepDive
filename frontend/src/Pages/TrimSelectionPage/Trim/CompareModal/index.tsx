import { ModalProps } from '@/global/type';
import Modal from '@/Components/Modal';
import ModalContainer from './ModalContainer';
import CompareModalHeader from './CompareModalHeader';
import TrimWrapper from './TrimWrapper';
import Trim from './Trim';
import getComparison, { getComparisonType } from '@/api/trim/getComparison';

function CompareModal({ showModal, setShowModal }: ModalProps) {
  const trimCompareData: getComparisonType | undefined = getComparison();

  if (!trimCompareData) return null;
  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <ModalContainer>
        <CompareModalHeader />
        <TrimWrapper>
          {trimCompareData.data.map(trim => (
            <Trim {...trim} key={trim.trim_name} />
          ))}
        </TrimWrapper>
      </ModalContainer>
    </Modal>
  );
}

export default CompareModal;
