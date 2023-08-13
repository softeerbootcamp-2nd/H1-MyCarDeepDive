import All from './TagIcon/All';
import Driving from './TagIcon/Driving';
import Using from './TagIcon/Using';
import ColdHot from './TagIcon/ColdHot';
import Parking from './TagIcon/Parking';
import Performance from './TagIcon/Performance';
import Style from './TagIcon/Style';

interface TagProps {
  tag: string;
  setTag: React.Dispatch<React.SetStateAction<string>>;
}

function Tag({ tag, setTag }: TagProps) {
  const getStyle = (ischecked: boolean) => {
    if (ischecked)
      return 'px-2.5 py-[6px] rounded border-[1.5px] font-body4-medium text-primary border-primary bg-grey-1000 flex gap-2';
    else
      return 'px-2.5 py-[7.5px] rounded font-body4-regular text-grey-400 bg-grey-800 flex gap-2';
  };

  return (
    <div className='h-16 max-w-5xl mx-auto flex gap-2 items-center border-b border-grey-700'>
      <button
        className={getStyle(tag === '전체')}
        onClick={() => setTag('전체')}
      >
        <All fillColor={tag === '전체'} />
        <span>전체</span>
      </button>
      <button
        className={getStyle(tag === '주행안전')}
        onClick={() => setTag('주행안전')}
      >
        <Driving fillColor={tag === '주행안전'} />
        <span>주행안전</span>
      </button>
      <button
        className={getStyle(tag === '사용편의')}
        onClick={() => setTag('사용편의')}
      >
        <Using fillColor={tag === '사용편의'} />
        <span>사용편의</span>
      </button>
      <button
        className={getStyle(tag === '추위/더위')}
        onClick={() => setTag('추위/더위')}
      >
        <ColdHot fillColor={tag === '추위/더위'} />
        <span>추위/더위</span>
      </button>
      <button
        className={getStyle(tag === '주차/출차')}
        onClick={() => setTag('주차/출차')}
      >
        <Parking fillColor={tag === '주차/출차'} />
        <span>주차/출차</span>
      </button>
      <button
        className={getStyle(tag === '퍼포먼스')}
        onClick={() => setTag('퍼포먼스')}
      >
        <Performance fillColor={tag === '퍼포먼스'} />
        <span>퍼포먼스</span>
      </button>
      <button
        className={getStyle(tag === '스타일')}
        onClick={() => setTag('스타일')}
      >
        <Style fillColor={tag === '스타일'} />
        <span>스타일</span>
      </button>
    </div>
  );
}

export default Tag;
