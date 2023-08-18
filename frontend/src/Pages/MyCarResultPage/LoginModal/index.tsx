import { closeModalHandler } from '@/utils';
import { ModalProps } from '@/global/type';
import Button from '@/Components/Button';
import Modal from '@/Components/Modal';
import CloseModal from '@/Components/Modal/CloseModal';

function LoginModal({ showModal, setShowModal }: ModalProps) {
  const showLoginPopup = () => {
    const width = 800;
    const height = 600;
    const left = window.screenX + (window.outerWidth - width) / 2;
    const top = window.screenY + (window.outerHeight - height) / 2;

    window.open(
      'https://www.hyundai.com/kr/ko/login',
      '현대닷컴 로그인',
      `width=${width},height=${height},left=${left},top=${top}`,
    );
  };

  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <div className='w-[427px] h-[192px] absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-grey-1000 rounded-xl'>
        <CloseModal />
        <div className='px-8 pt-6'>
          <p className='font-h1-medium text-grey-50'>
            로그인이 필요한 서비스에요.
            <br />
            로그인 화면으로 이동하시겠어요?
          </p>
          <div className='mt-[34px] flex justify-between gap-[7px]'>
            <Button
              width='w-full'
              height='h-[46px]'
              variant='secondary'
              text='아니요'
              onClick={closeModalHandler}
            />
            <Button
              width='w-full'
              height='h-[46px]'
              variant='primary'
              text='네'
              onClick={showLoginPopup}
            />
          </div>
        </div>
      </div>
    </Modal>
  );
}

export default LoginModal;
