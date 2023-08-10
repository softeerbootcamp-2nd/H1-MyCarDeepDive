import headerDownArrowBlack from '@/assets/icon/headerDownArrowBlack.svg';
import headerDownArrow from '@/assets/icon/headerDownArrow.svg';

function DropDownIcon() {
  const isHome: boolean = location.pathname === '/';
  return (
    <img
      src={isHome ? headerDownArrowBlack : headerDownArrow}
      alt='headerDownArrow'
      className='w-5'
    />
  );
}

export default DropDownIcon;
