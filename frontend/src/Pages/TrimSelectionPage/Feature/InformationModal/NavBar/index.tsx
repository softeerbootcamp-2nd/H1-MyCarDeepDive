import { NavBarCategoryProps } from '@/global/type';
import NavBarSelected from './NavBarSelected';
import NavBarItem from './NavBarItem';

const NavBarItemData = ['엔진', '바디타입', '구동방식'];

interface NavBarProps extends NavBarCategoryProps {
  offsetX: number;
}

function NavBar({ offsetX, category, categoryClickHandler }: NavBarProps) {
  return (
    <div className='w-full border-b border-grey-700 absolute bottom-0 left-0'>
      <div className='flex flex-wrap -mb-px mx-10 font-body2-medium text-grey-500 text-center relative'>
        <NavBarSelected offsetX={offsetX} />
        {NavBarItemData.map(item => (
          <NavBarItem
            category={category}
            categoryClickHandler={categoryClickHandler}
            item={item}
            key={item}
          />
        ))}
      </div>
    </div>
  );
}

export default NavBar;
