import { useEffect, useState } from 'react';
import Tab from './Tab';
import Tag from './Tag';
import AllCount from './AllCount';
import AdditionalOption from './AdditionalOption';
import Pagination from './Pagination';
import BottomButtons from './BottomButtons';
import OptionModal from './OptionModal';
import BasicOption from './BasicOption';
import SituationOption from './SituationOption';

function OptionSelectitonPage() {
  const [offsetX, setOffsetX] = useState(0);
  const [category, setCategory] = useState('추가 옵션');
  const [tag, setTag] = useState('전체');
  const [page, setPage] = useState(1);
  const [maxPage, setMaxPage] = useState(0);
  const [totalCount, setTotalCount] = useState(0);
  const [showOptionModal, setShowOptionModal] = useState(false);

  const categoryClickHandler = (
    e: React.MouseEvent<HTMLButtonElement, MouseEvent>,
  ) => {
    setCategory(e.currentTarget.innerText);
    setOffsetX(e.currentTarget.offsetLeft);
  };

  useEffect(() => {
    window.scrollTo({
      top: 0,
    });
  }, []);

  return (
    <div className='mt-[120px]'>
      <Tab
        category={category}
        offsetX={offsetX}
        categoryClickHandler={categoryClickHandler}
        setTag={setTag}
        setPage={setPage}
      />
      <Tag tag={tag} setTag={setTag} category={category} setPage={setPage} />

      {(category !== '추가 옵션' || tag === '전체') && (
        <AllCount totalCount={totalCount} />
      )}

      {category === '추가 옵션' && tag === '전체' ? (
        <AdditionalOption
          page={page}
          setShowOptionModal={setShowOptionModal}
          setMaxPage={setMaxPage}
          setTotalCount={setTotalCount}
        />
      ) : category === '기본 포함 옵션' ? (
        <BasicOption
          page={page}
          setShowOptionModal={setShowOptionModal}
          setMaxPage={setMaxPage}
          setTotalCount={setTotalCount}
          tag={tag}
        />
      ) : (
        <SituationOption setShowOptionModal={setShowOptionModal} />
      )}

      {(category !== '추가 옵션' || tag === '전체') && (
        <Pagination page={page} setPage={setPage} maxPage={maxPage} />
      )}

      <BottomButtons />
      {showOptionModal && (
        <OptionModal
          showOptionModal={showOptionModal}
          setShowOptionModal={setShowOptionModal}
        />
      )}
    </div>
  );
}

export default OptionSelectitonPage;
