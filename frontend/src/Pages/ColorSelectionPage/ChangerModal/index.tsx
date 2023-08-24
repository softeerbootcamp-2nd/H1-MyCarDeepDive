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
import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';

interface Props extends ModalProps {
  wantedOtherColor: any;
  clickHandler: () => void;
  type: 'exterial' | 'interial';
}

function ChangerModal({
  showModal,
  setShowModal,
  wantedOtherColor,
  clickHandler,
  type,
}: Props) {
  const { color } = useContext(CarContext);
  if (!wantedOtherColor) return;
  const { price } = wantedOtherColor;
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
          {type === 'exterial' && (
            <ChangePrice priceGap={color.exteriorColor.price - price} />
          )}
          {type === 'interial' && (
            <ChangePrice priceGap={color.interiorColor.price - price} />
          )}

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
