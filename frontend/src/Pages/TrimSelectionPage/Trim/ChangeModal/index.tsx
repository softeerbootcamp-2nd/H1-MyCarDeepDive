import { ModalProps } from '@/global/type';
import Modal from '@/Components/Modal';
import CloseModal from '@/Components/Modal/CloseModal';
import ModalContentsWrapper from './ModalContentsWrapper';
import Title from './Title';
import UnlockColor from './UnlockColor';
import UnlockOption from './UnlockOption';
import Buttons from './Buttons';

export interface Props extends ModalProps {
  wantedTrim: {
    carSpecId: number | null;
    price: number | null;
    trimId: number | null;
    trimName: string | null;
    trimImage: string | null;
  };
  setTrimImage: React.Dispatch<React.SetStateAction<string>>;
}

function ChangeModal({
  showModal,
  setShowModal,
  wantedTrim,
  setTrimImage,
}: Props) {
  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <ModalContentsWrapper>
        <CloseModal />
        <div className='mt-6 mx-8'>
          <Title />
          <UnlockColor />
          <UnlockOption />
          <Buttons wantedTrim={wantedTrim} setTrimImage={setTrimImage} />
        </div>
      </ModalContentsWrapper>
    </Modal>
  );
}

export default ChangeModal;
