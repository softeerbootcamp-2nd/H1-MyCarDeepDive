import { useLocation } from 'react-router-dom';
import LogoWhite from '@/assets/icon/logo-white.svg';
import Logo from '@/assets/icon/logo.svg';
import headerDownArrowBlack from '@/assets/icon/headerDownArrowBlack.svg';
import headerDownArrow from '@/assets/icon/headerDownArrow.svg';
import Navigation from './Navigation';

function Header() {
  const location = useLocation();
  const isHome: boolean = location.pathname === '/';
  const isSelectionPage: boolean = location.pathname.startsWith('/select/');

  return (
    <header
      className={`fixed w-full ${
        isSelectionPage === true ? 'h-[120px] shadow-md' : 'h-[92px]'
      } z-30 top-0 left-0 ${!isHome && 'bg-grey-1000'}`}
    >
      <div className='max-w-5xl mx-auto'>
        <div className='flex mt-[33px]'>
          <img
            src={isHome ? LogoWhite : Logo}
            alt='Hyundai-Logo'
            className='w-[129px]'
          />
          <p
            className={`font-body4-medium mr-1 ml-4 flex items-center ${
              isHome ? 'text-grey-600' : 'text-grey-50'
            }`}
          >
            팰리세이드
          </p>
          <img
            src={isHome ? headerDownArrowBlack : headerDownArrow}
            alt='headerDownArrow'
            className='w-5'
          />
        </div>
        {isSelectionPage && <Navigation />}
      </div>
    </header>
  );
}

export default Header;
