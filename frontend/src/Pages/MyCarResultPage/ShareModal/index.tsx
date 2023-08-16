import { ModalProps } from '@/global/type';
import Button from '@/Components/Button';
import Modal from '@/Components/Modal';
import CloseModal from '@/Components/Modal/CloseModal';

function ShareModal({ showModal, setShowModal }: ModalProps) {
  const copyURL = () => {
    const currentURL = window.location.href;

    navigator.clipboard
      .writeText(currentURL)
      .then(() => {
        alert('복사 완료');
      })
      .catch(() => {
        alert('복사 실패');
      });
  };

  return (
    <Modal showModal={showModal} setShowModal={setShowModal}>
      <div className='w-[427px] h-[312px] absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-grey-1000 rounded-xl'>
        <CloseModal />
        <div className='px-8 pt-6'>
          <p className='font-h1-medium text-grey-50'>공유하기</p>
          <p className='font-body4-regular text-grey-400 mt-2 mb-9'>
            구성하신 견적이 URL로 생성되었어요.
            <br />
            아래 URL을 공유하시면 견적을 다시 확인하실 수 있어요.
            <br />
            (30일간 유효)
          </p>
          <div className='mb-8 font-body4-regular text-grey-600 px-3 py-[9px] border border-primary rounded-lg'>
            https://www.hyundai.com/kr/ko/e/vehicles/estimation/
          </div>
          <Button
            width='w-full'
            height='h-[46px]'
            variant='primary'
            text='복사하기'
            onClick={copyURL}
          />
        </div>
      </div>
    </Modal>
  );
}

export default ShareModal;
