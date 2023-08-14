import { useEffect, useRef, useState } from 'react';
import pageLeft from '@/assets/icon/page-left.svg';
import pageRight from '@/assets/icon/page-right.svg';
import PageButton from './PageButton';

interface PaginationProps {
  page: number;
  setPage: React.Dispatch<React.SetStateAction<number>>;
  maxPage: number;
}

function Pagination({ page, setPage, maxPage }: PaginationProps) {
  const pageRef = [
    useRef<HTMLButtonElement>(null),
    useRef<HTMLButtonElement>(null),
    useRef<HTMLButtonElement>(null),
    useRef<HTMLButtonElement>(null),
    useRef<HTMLButtonElement>(null),
  ];
  const [offsetX, setOffsetX] = useState(-10);

  const pageUpDown = (amount: number) => {
    if (amount === 1 && page < maxPage) pageRef[page].current?.click();
    if (amount === -1 && page > 1) pageRef[page - 2].current?.click();
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
  }, [maxPage]);

  if (maxPage < 2) return null;
  return (
    <div className='mt-5 mb-12 flex justify-center relative'>
      <button className='mr-2' onClick={() => pageUpDown(-1)}>
        <img src={pageLeft} alt='pageDown' />
      </button>
      {[...Array(maxPage)].map((_, idx) => {
        return (
          <PageButton
            page={idx + 1}
            pageRef={pageRef}
            categoryClickHandler={categoryClickHandler}
            key={idx}
          />
        );
      })}
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
