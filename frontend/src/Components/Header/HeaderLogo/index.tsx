import LogoWhite from '@/assets/icon/logo-white.svg';
import Logo from '@/assets/icon/logo.svg';
import { useNavigate } from 'react-router-dom';

function HeaderLogo() {
  const navigation = useNavigate();
  const isHome: boolean = location.pathname === '/';

  return (
    <img
      src={isHome ? LogoWhite : Logo}
      alt='Hyundai-Logo'
      className='w-[129px] cursor-pointer'
      onClick={() => !isHome && navigation('/')}
    />
  );
}

export default HeaderLogo;
