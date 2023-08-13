import { useEffect, useRef, useState } from 'react';
import pageLeft from '@/assets/icon/page-left.svg';
import pageRight from '@/assets/icon/page-right.svg';

interface PaginationProps {
  page: number;
  setPage: React.Dispatch<React.SetStateAction<number>>;
}

function Pagination({ page, setPage }: PaginationProps) {
  const pageRef = [
    useRef<HTMLButtonElement>(null),
    useRef<HTMLButtonElement>(null),
  ];
  const [offsetX, setOffsetX] = useState(-10);

  const pageUpDown = (amount: number) => {
    if (amount === 1 && page < 2) pageRef[1].current?.click();
    if (amount === -1 && page > 1) pageRef[0].current?.click();
  };

  const categoryClickHandler = (
    e: React.MouseEvent<HTMLButtonElement, MouseEvent>,
    page: number,
  ) => {
    setOffsetX(e.currentTarget.offsetLeft);
    setPage(page);
  };

  useEffect(() => {
    if (pageRef[0].current) setOffsetX(pageRef[0].current.offsetLeft);
  }, []);

  return (
    <div className='mt-5 mb-12 flex justify-center relative'>
      <button className='mr-2' onClick={() => pageUpDown(-1)}>
        <img src={pageLeft} alt='pageDown' />
      </button>
      <button
        ref={pageRef[0]}
        className={`w-9 h-9 rounded-full font-body3-medium flex justify-center items-center ${
          page === 1 ? 'text-grey-100' : 'text-grey-300'
        }`}
        onClick={e => categoryClickHandler(e, 1)}
      >
        1
      </button>
      <button
        ref={pageRef[1]}
        className={`w-9 h-9 rounded-full font-body3-medium flex justify-center items-center ${
          page === 2 ? 'text-grey-100' : 'text-grey-300'
        }`}
        onClick={e => categoryClickHandler(e, 2)}
      >
        2
      </button>
      <button className='ml-2' onClick={() => pageUpDown(1)}>
        <img src={pageRight} alt='pageUp' />
      </button>

      <div
        className={`w-9 h-9 rounded-full bg-grey-700 absolute top-0 left-0 transition-all duration-300 ease-in-out -z-10`}
        style={{
          transform: `translateX(${offsetX}px)`,
        }}
      />
    </div>
  );
}

export default Pagination;
