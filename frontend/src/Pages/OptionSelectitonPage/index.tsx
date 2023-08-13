import { useState } from 'react';
import Tab from './Tab';
import Tag from './Tag';
import AllCount from './AllCount';
import AdditionalOption from './AdditionalOption';
import Pagination from './Pagination';
import BottomButtons from './BottomButtons';

function OptionSelectitonPage() {
  const [offsetX, setOffsetX] = useState(0);
  const [category, setCategory] = useState('추가 옵션');
  const [tag, setTag] = useState('전체');
  const [page, setPage] = useState(1);

  const categoryClickHandler = (
    e: React.MouseEvent<HTMLButtonElement, MouseEvent>,
  ) => {
    setCategory(e.currentTarget.innerText);
    setOffsetX(e.currentTarget.offsetLeft);
  };

  return (
    <div className='mt-[120px]'>
      <Tab
        category={category}
        offsetX={offsetX}
        categoryClickHandler={categoryClickHandler}
      />
      <Tag tag={tag} setTag={setTag} />
      <AllCount />
      <AdditionalOption page={page} />
      <Pagination page={page} setPage={setPage} />
      <BottomButtons />
    </div>
  );
}

export default OptionSelectitonPage;
