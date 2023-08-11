import closeIcon from '@/assets/icon/x-modal-icon.svg';
import smartCruiseControl from '@/assets/image/smart-cruise-control.png';

function OptionToolTip() {
  return (
    <div
      className='w-[300px] bg-grey-1000 transform z-50 px-6 py-5 rounded-lg shadow-xl'
      style={{
        position: 'fixed',
        top: 300,
        left: 300,
      }}
    >
      <div className='relative'>
        <div className='mr-10 font-body2-bold text-black'>
          네비게이션 기반 스마트 크루즈 컨트롤(진출입로)
        </div>
        <img
          src={closeIcon}
          alt='close-modal'
          className='absolute top-0 right-0 cursor-pointer rounded hover:bg-grey-700'
          // onClick={closeModalHandler}
        />
      </div>
      <img
        src={smartCruiseControl}
        alt='smartCruiseControl'
        className='rounded mt-4 mb-3'
      />
      <p className='font-body4-regular text-grey-200'>
        스마트 크루즈 중 고속도로/도시고속도로/ 자동차전용 도로 내 고속도로
        진출입로 주행 시 차로를 판단하여 사전감속 또 최적 속도에 맞추어 감속을
        진행합니다.
      </p>
      <p className='mt-1 font-caption1-regular text-grey-400'>
        *사진과 설명은 참고용이며 실제 차량과는 상이할 수 있습니다.
      </p>
    </div>
  );
}

export default OptionToolTip;
