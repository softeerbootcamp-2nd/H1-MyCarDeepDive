import LogoWhite from '@/assets/icon/logo-white.svg';
import Logo from '@/assets/icon/logo.svg';

function HeaderLogo() {
  const isHome: boolean = location.pathname === '/';

  return (
    <img
      src={isHome ? LogoWhite : Logo}
      alt='Hyundai-Logo'
      className='w-[129px]'
    />
  );
}

export default HeaderLogo;
