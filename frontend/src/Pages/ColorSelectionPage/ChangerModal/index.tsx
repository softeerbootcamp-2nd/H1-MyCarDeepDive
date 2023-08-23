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
  wantedOtherColor: any;

  clickHandler: {
    clickAvailableColorHandler: ({
      currentTarget,
    }: React.MouseEvent<HTMLButtonElement, MouseEvent>) => void;
  };
}

function ChangerModal({
  showModal,
  setShowModal,
  wantedOtherColor,
  clickHandler,
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
            clickHandler={clickHandler}
          />
        </div>
      </ModalContentsWrapper>
    </Modal>
  );
}

export default ChangerModal;
