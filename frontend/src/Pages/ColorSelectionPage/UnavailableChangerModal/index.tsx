import Modal from '@/Components/Modal';
import CloseModal from '@/Components/Modal/CloseModal';
import ModalContentsWrapper from '@/Pages/ColorSelectionPage/ChangerModal/ModalContentsWrapper';

import { ModalProps } from '@/global/type';
import Buttons from '../ChangerModal/Buttons';
import Explain from '../ChangerModal/Explain';
import Title from '../ChangerModal/Title';

interface Props extends ModalProps {
  wantedUnavailableColor: any;
  clickHandler: () => void;
  type: 'exterial' | 'interial';
}

function UnavailableChangerModal({
  showModal,
  setShowModal,
  wantedUnavailableColor,
  clickHandler,
  type,
}: Props) {
  const phrase = type === 'exterial' ? '외장' : '내장';
  const anotherPhrase = type === 'exterial' ? '내장' : '외장';
  if (!wantedUnavailableColor) return;
  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <ModalContentsWrapper>
        <CloseModal />
        <div className='mt-6 mx-8 whitespace-pre'>
          <Title
            description={`${phrase} 색상을\n${wantedUnavailableColor.name} 색상으로\n변경하시겠어요?`}
          />
          <Explain
            wantedOtherColor={wantedUnavailableColor}
            description={`변경 시, 선택한 ${anotherPhrase} 색상은 해제됩니다.`}
          />
          <Buttons
            wantedOtherColor={wantedUnavailableColor}
            clickHandler={clickHandler}
          />
        </div>
      </ModalContentsWrapper>
    </Modal>
  );
}

export default UnavailableChangerModal;
