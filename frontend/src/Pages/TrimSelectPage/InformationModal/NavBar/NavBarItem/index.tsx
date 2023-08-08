import { NavBarCategoryProps } from '@/global/type';

interface NavBarItemProps extends NavBarCategoryProps {
  item: string;
}

function NavBarItem({ category, categoryClickHandler, item }: NavBarItemProps) {
  return (
    <button
      className={`inline-block w-24 leading-[22px] py-3 ${
        category === item ? 'text-primary font-bold' : 'hover:text-grey-400'
      }`}
      onClick={e => categoryClickHandler(e)}
    >
      {item}
    </button>
  );
}

export default NavBarItem;
