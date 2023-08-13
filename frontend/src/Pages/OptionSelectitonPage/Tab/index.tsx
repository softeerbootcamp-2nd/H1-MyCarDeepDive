import { NavBarCategoryProps } from '@/global/type';

interface TabProps extends NavBarCategoryProps {
  offsetX: number;
}

function Tab({ offsetX, category, categoryClickHandler }: TabProps) {
  return (
    <div className='w-full border-b border-grey-700 pt-5'>
      <div className='flex flex-wrap max-w-5xl -mb-px mx-auto font-h2-medium text-grey-600 text-center relative'>
        <hr
          className={`${
            offsetX ? 'w-32' : 'w-24'
          } h-0.5 bg-grey-200 border-0 absolute bottom-0 transition-all duration-300 ease-in-out`}
          style={{
            transform: `translateX(${offsetX}px)`,
          }}
        />
        <button
          className={`inline-block w-24 leading-[24px] py-2 mr-10 ${
            category === '추가 옵션' ? 'text-grey-200' : 'hover:text-grey-400'
          }`}
          onClick={e => categoryClickHandler(e)}
        >
          추가 옵션
        </button>
        <button
          className={`inline-block w-32 leading-[24px] py-2 ${
            category === '기본 포함 옵션'
              ? 'text-grey-200'
              : 'hover:text-grey-400'
          }`}
          onClick={e => categoryClickHandler(e)}
        >
          기본 포함 옵션
        </button>
      </div>
    </div>
  );
}

export default Tab;
