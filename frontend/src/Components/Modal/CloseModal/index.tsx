import { closeModalHandler } from '@/utils';
import closeIcon from '@/assets/icon/x-modal-icon.svg';

function CloseModal() {
  return (
    <img
      src={closeIcon}
      alt='close-modal'
      className='absolute top-6 right-6 cursor-pointer rounded hover:bg-grey-700'
      onClick={closeModalHandler}
    />
  );
}

export default CloseModal;
