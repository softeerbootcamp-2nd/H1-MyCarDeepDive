import { useEffect, useRef } from 'react';
import lifeStyleFamily from '../../assets/image/lifeStyle-family.png';
import logoWhite from '../../assets/icon/logo-white.svg';
import lifeStyleProfile from '../../assets/image/lifeStyle-profile1.png';
import comport from '../../assets/image/comport.png';
import smartSense from '../../assets/image/smartSense.png';
import Prestige from '../../assets/image/Prestige.png';

type LifeStyleModalProps = {
  showModal: boolean;
  setShowModal: React.Dispatch<React.SetStateAction<boolean>>;
};

function LifeStyleModal({ showModal, setShowModal }: LifeStyleModalProps) {
  const modalRef = useRef<HTMLDivElement>(null);

  const modalOutSideClick = (e: React.MouseEvent<HTMLElement>) => {
    if (modalRef.current === e.target) {
      setShowModal(false);
    }
  };

  useEffect(() => {
    const eventHandler = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        setShowModal(!showModal);
      }
    };
    document.addEventListener('keydown', eventHandler);

    return () => {
      document.removeEventListener('keydown', eventHandler);
    };
  }, []);

  return (
    <div
      ref={modalRef}
      onClick={e => modalOutSideClick(e)}
      className={`modal-container fixed top-0 left-0 z-50 overflow-y-auto md:inset-0 min-h-screen bg-bgModal scale-100 ${
        showModal ? 'active' : ''
      }`}
    >
      <div className='my-[90px] mx-auto shadow w-[688px] rounded-2xl h-[1318px] bg-white'>
        <section
          className='w-full rounded-t-2xl h-[256px] bg-cover bg-center bg-no-repeat bg-blend-multiply'
          style={{ backgroundImage: `url(${lifeStyleFamily})` }}
        >
          <div className='pt-[36px] pl-[40px]'>
            <img src={logoWhite} alt='Hyundai-white-Logo' />
            <div className='mt-[63px] flex gap-2'>
              <div className='w-[69px] h-[30px] bg-[#0f1114] bg-opacity-80 font-caption1-medium text-grey-1000 flex items-center justify-center rounded-full'>
                #주행안전
              </div>
              <div className='w-[69px] h-[30px] bg-[#0f1114] bg-opacity-80 font-caption1-medium text-grey-1000 flex items-center justify-center rounded-full'>
                #사용편의
              </div>
            </div>
            <div className='mt-[8px] font-h2-medium'>
              <span className='text-[32px] leading-[44px] text-grey-1000'>
                가족과 함께 타서 안전을 중시해요.
              </span>
            </div>
            <div className='mt-[10px] font-body3-regular text-grey-1000 text-opacity-70'>
              김현대씨의 라이프스타일 엿보기
            </div>
          </div>
        </section>

        <div className='w-[607px] mx-auto'>
          <div className='mt-10 flex gap-4'>
            <img
              src={lifeStyleProfile}
              alt='profile'
              className='w-[48px] h-[48px] rounded-full'
              onClick={() => setShowModal(false)}
            />
            <div className='flex flex-col justify-center'>
              <div className='font-body3-medium text-grey-50'>김현대</div>
              <div className='font-caption1-regular text-grey-400'>
                두 아이의 엄마
              </div>
            </div>
          </div>

          <div className='h-[80px] mt-5 rounded bg-secondary bg-opacity-10 font-body2-medium text-secondary whitespace-pre flex items-center justify-center text-center'>
            {'“우리 아이들과 함께 타는 차는 항상\n 안전해야 한다고 생각해요.”'}
          </div>

          <div className='font-h3-medium mt-8'>
            <span className='text-[24px] leading-[30px] text-grey-0'>
              For You
            </span>
          </div>

          <div className='mt-3 relative overflow-hidden'>
            <div className='h-[80px] bg-grey-100'>
              <div className='h-full flex flex-col justify-center ml-5'>
                <div className='font-body4-medium text-grey-1000'>
                  Le Blanc(르블랑)
                </div>
                <div className='font-caption1-regular text-grey-500'>
                  가솔린 8인승 2WD
                </div>
              </div>
            </div>
            <div className='h-[80px] bg-grey-500'></div>
            <img
              src={Prestige}
              alt='Prestige'
              className='h-[150px] object-cover absolute bottom-0 left-[350px]'
            />
          </div>

          <div className='flex font-body4-regular text-grey-200'>
            <div>
              <img src={comport} alt='컴포트 II' className='mb-3' />
              <span>컴포트 II</span>
            </div>
            <div>
              <img src={smartSense} alt='현대 스마트 센스 I' className='mb-3' />
              <span>현대 스마트 센스 I</span>
            </div>
          </div>
          <hr className='h-px my-8 bg-grey-700 border-0' />
          <div className='font-h2-medium '>
            <span className='text-[24px] leading-[30px] text-grey-0'>
              Interview
            </span>

            <div className='font-body3-medium mt-3'>
              <span className='text-primary leading-[22px] mr-2'>Q.</span>
              <span className='text-grey-50'>어떤 용도로 차를 사용하세요?</span>
              <div className='h-[46px] mt-2 flex items-center px-3 font-body4-regular text-secondary bg-secondary bg-opacity-10 rounded-l-lg rounded-tr-lg'>
                저는 차를 타고 출퇴근도 하지만 주중에 아이들 픽업하거나 마트 갈
                때도 자주 타곤 합니다.
              </div>
            </div>
            <div className='font-body3-medium mt-8'>
              <span className='text-primary leading-[22px] mr-2'>Q.</span>
              <span className='text-grey-50'>
                차를 살 때 가장 중요하게 생각하는 부분이 뭔가요?
              </span>
              <div className='h-[68px] mt-2 flex items-center px-3 font-body4-regular text-secondary bg-secondary bg-opacity-10 rounded-l-lg rounded-tr-lg'>
                저는 차를 살 때 안전을 중요하게 생각해요. 가족들이 같이 타는
                차라 항상 사고에 경각심을 갖고 있죠. 펠리세이드는 그 점에서
                뒷좌석 에어백도 터지는 모델이라 안심이 되는 편이에요.
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default LifeStyleModal;
