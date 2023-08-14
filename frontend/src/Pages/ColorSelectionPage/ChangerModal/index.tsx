import Modal from '@/Components/Modal';
import CloseModal from '@/Components/Modal/CloseModal';
import ModalContentsWrapper from '@/Pages/ColorSelectionPage/ChangerModal/ModalContentsWrapper';
import Title from './Title';

import { ModalProps } from '@/global/type';
import Buttons from './Buttons';
import Explain from './Explain';
import CurrentTrim from './CurrentTrim';
import ChangeTrim from './ChangeTrim';
import UnderLine from '@/Components/UnderLine';
import ChangePrice from './ChangePrice';

interface Props extends ModalProps {
  wantedOtherColor: string;
  changerClickHandler: React.Dispatch<React.SetStateAction<string>>;
}

function ChangerModal({
  showModal,
  setShowModal,
  wantedOtherColor,
  changerClickHandler,
}: Props) {
  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <ModalContentsWrapper>
        <CloseModal />
        <div className='mt-6 mx-8'>
          <Title />
          <Explain wantedOtherColor={wantedOtherColor} />
          <CurrentTrim />
          <ChangeTrim />
          <UnderLine margin='mt-9 mb-[13px]' color='bg-grey-500' />
          <ChangePrice priceGap={12100000} />
          <Buttons
            wantedOtherColor={wantedOtherColor}
            changerClickHandler={changerClickHandler}
          />
        </div>
      </ModalContentsWrapper>
    </Modal>
  );
}

export default ChangerModal;
