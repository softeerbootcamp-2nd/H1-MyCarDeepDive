import { useEffect, useRef, useState } from 'react';
import PageButton from './PageButton';
import pageLeft from '@/assets/icon/page-left.svg';
import pageRight from '@/assets/icon/page-right.svg';

interface PaginationProps {
  page: number;
  setPage: React.Dispatch<React.SetStateAction<number>>;
  maxPage: number;
}

function Pagination({ page, setPage, maxPage }: PaginationProps) {
  const [isVisible, setIsVisible] = useState(false);
  const [prevScrollPos, setPrevScrollPos] = useState(window.scrollY);
  const pageRef = [
    useRef<HTMLButtonElement>(null),
    useRef<HTMLButtonElement>(null),
    useRef<HTMLButtonElement>(null),
    useRef<HTMLButtonElement>(null),
    useRef<HTMLButtonElement>(null),
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
    const nowPage = pageRef[page - 1].current?.offsetLeft;
    if (!nowPage) return;

    setOffsetX(nowPage);
  }, [maxPage]);

  const isScrollable = () => {
    const hasScrollbar = document.body.clientHeight > window.innerHeight;
    return hasScrollbar;
  };

  const handleScroll = () => {
    const currentScrollPos = window.scrollY;

    if (prevScrollPos > currentScrollPos && isScrollable()) {
      setIsVisible(false);
    } else {
      setIsVisible(true);
    }

    setPrevScrollPos(currentScrollPos);
  };

  useEffect(() => {
    window.addEventListener('scroll', handleScroll);
    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, [prevScrollPos]);

  useEffect(() => {
    window.scrollTo({
      top: 0,
    });

    if (isScrollable()) setIsVisible(false);
  }, [page]);

  if (maxPage < 2) return null;
  return (
    <div
      className={`w-full fixed left-0 bottom-0 bg-grey-1000 bg-opacity-95 shadow-inner transition-all duration-1000 ${
        isVisible ? 'h-[60px]' : 'h-0'
      }`}
    >
      <div className='flex justify-center relative my-3'>
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
          className={`w-9 h-9 rounded-full bg-grey-700 border border-primary absolute top-0 left-0 transition-all duration-300 ease-in-out -z-10`}
          style={{
            transform: `translateX(${offsetX}px)`,
          }}
        />
      </div>
    </div>
  );
}

export default Pagination;
