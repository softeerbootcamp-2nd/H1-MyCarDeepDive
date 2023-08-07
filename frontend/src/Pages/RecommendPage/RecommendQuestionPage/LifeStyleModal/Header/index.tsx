import HeaderTag from './HeaderTag';

interface HeaderProps {
  lifeStyleFamily: string;
  logoWhite: string;
}

function Header({ lifeStyleFamily, logoWhite }: HeaderProps) {
  return (
    <section
      className='w-full rounded-t-2xl h-64 bg-cover bg-center bg-no-repeat bg-blend-multiply'
      style={{ backgroundImage: `url(${lifeStyleFamily})` }}
    >
      <div className='pt-9 pl-10'>
        <img src={logoWhite} alt='Hyundai-white-Logo' />
        <div className='mt-16 flex gap-2'>
          <HeaderTag tag={'#주행안전'} />
          <HeaderTag tag={'#사용편의'} />
        </div>
        <div className='mt-2 font-h2-medium'>
          <span className='text-[32px] leading-[44px] text-grey-1000'>
            가족과 함께 타서 안전을 중시해요.
          </span>
        </div>
        <div className='mt-2.5 font-body3-regular text-grey-1000 text-opacity-70'>
          김현대씨의 라이프스타일 엿보기
        </div>
      </div>
    </section>
  );
}

export default Header;
