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
  wantedOtherColorTrim: any;
  clickHandler: () => void;
}

function ChangerModal({
  showModal,
  setShowModal,
  wantedOtherColor,
  clickHandler,
  wantedOtherColorTrim,
}: Props) {
  const { carSpec } = useContext(CarContext);
  if (!wantedOtherColor || !wantedOtherColorTrim) return;
  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <ModalContentsWrapper>
        <CloseModal />
        <div className='mt-6 mx-8 whitespace-pre'>
          <Title description={`Calligraphy 트림으로\n변경하시겠어요?`} />
          <Explain
            wantedOtherColor={wantedOtherColor}
            description='색상은 트림 변경 후 선택할 수 있어요.'
          />
          <CurrentTrim />
          <ChangeTrim wantedOtherColorTrim={wantedOtherColorTrim} />
          <UnderLine margin='mt-9 mb-[13px]' color='bg-grey-500' />
          <ChangePrice priceGap={wantedOtherColorTrim.price - carSpec.price} />
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
