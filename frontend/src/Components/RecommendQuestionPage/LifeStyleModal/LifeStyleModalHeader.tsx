import LifeStyleModalHeaderTag from './LifeStyleModalHeaderTag';

interface LifeStyleModalHeaderProps {
  lifeStyleFamily: string;
  logoWhite: string;
}

function LifeStyleModalHeader({
  lifeStyleFamily,
  logoWhite,
}: LifeStyleModalHeaderProps) {
  return (
    <section
      className='w-full rounded-t-2xl h-[256px] bg-cover bg-center bg-no-repeat bg-blend-multiply'
      style={{ backgroundImage: `url(${lifeStyleFamily})` }}
    >
      <div className='pt-[36px] pl-[40px]'>
        <img src={logoWhite} alt='Hyundai-white-Logo' />
        <div className='mt-[63px] flex gap-2'>
          <LifeStyleModalHeaderTag tag={'#주행안전'} />
          <LifeStyleModalHeaderTag tag={'#사용편의'} />
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
  );
}

export default LifeStyleModalHeader;
