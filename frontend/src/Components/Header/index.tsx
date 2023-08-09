import { useLocation } from 'react-router-dom';
import { useState } from 'react';
import NavigationRadioGroup from './NavigationRadioGroup';
import PriceDetailButton from './priceDetailButton';
import ShowQuotationButton from './showQuotation';
import HeaderLogo from './HeaderLogo';
import HeaderTitle from './HeaderTitle';
import DropDownIcon from './DropDownIcon';

function Header() {
  const location = useLocation();
  const isHome: boolean = location.pathname === '/';
  const isSelectionPage: boolean = location.pathname.startsWith('/select/');

  const [priceInfo, setPriceInfo] = useState(false);

  return (
    <header
      className={`fixed w-full ${
        isSelectionPage
          ? !priceInfo
            ? 'h-[120px] shadow-md'
            : 'h-[322px] shadow-md'
          : 'h-[92px]'
      } z-30 top-0 left-0 ${!isHome && 'bg-grey-1000'}`}
    >
      <div className='max-w-5xl mx-auto'>
        <div className='flex mt-[33px]'>
          <HeaderLogo />
          <HeaderTitle />
          <DropDownIcon />
        </div>

        {isSelectionPage && (
          <div className='flex'>
            <NavigationRadioGroup />
            <div className='mt-[10px] flex'>
              <PriceDetailButton
                priceInfo={priceInfo}
                setPriceInfo={setPriceInfo}
              />
              <ShowQuotationButton />
            </div>
          </div>
        )}
      </div>
    </header>
  );
}

export default Header;
