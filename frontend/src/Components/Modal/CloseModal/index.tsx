import closeIcon from '@/assets/icon/x-modal-icon.svg';

function CloseModal() {
  const closeModalHandler = () => {
    const clickEvent = new MouseEvent('click', {
      bubbles: true,
      cancelable: true,
      view: window,
      clientX: 0,
      clientY: 0,
    });

    // 특정 요소를 선택하고 마우스 클릭 이벤트 디스패치
    const targetElement = document.elementFromPoint(0, 0);
    targetElement?.dispatchEvent(clickEvent);
  };

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
