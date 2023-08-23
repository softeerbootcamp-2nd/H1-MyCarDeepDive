import TagButton from './TagButton';
import mainBlack from '@/assets/icon/category-main-black.svg';
import mainPrimary from '@/assets/icon/category-main-primary.svg';
import allBlack from '@/assets/icon/category-all-black.svg';
import allPrimary from '@/assets/icon/category-all-primary.svg';
import drivingBlack from '@/assets/icon/category-driving-black.svg';
import drivingPrimary from '@/assets/icon/category-driving-primary.svg';
import usingBlack from '@/assets/icon/category-using-black.svg';
import usingPrimary from '@/assets/icon/category-using-primary.svg';
import coldHotBlack from '@/assets/icon/category-cold-hot-black.svg';
import coldHotPrimary from '@/assets/icon/category-cold-hot-primary.svg';
import parkingBlack from '@/assets/icon/category-parking-black.svg';
import parkingPrimary from '@/assets/icon/category-parking-primary.svg';
import performanceBlack from '@/assets/icon/category-performance-black.svg';
import performancePrimary from '@/assets/icon/category-performance-primary.svg';
import styleBlack from '@/assets/icon/category-style-black.svg';
import stylePrimary from '@/assets/icon/category-style-primary.svg';

const TagData = [
  {
    tagName: '대표',
    blackIcon: mainBlack,
    primaryIcon: mainPrimary,
  },
  {
    tagName: '전체',
    blackIcon: allBlack,
    primaryIcon: allPrimary,
  },
  {
    tagName: '주행안전',
    blackIcon: drivingBlack,
    primaryIcon: drivingPrimary,
  },
  {
    tagName: '사용편의',
    blackIcon: usingBlack,
    primaryIcon: usingPrimary,
  },
  {
    tagName: '추위/더위',
    blackIcon: coldHotBlack,
    primaryIcon: coldHotPrimary,
  },
  {
    tagName: '주차/출차',
    blackIcon: parkingBlack,
    primaryIcon: parkingPrimary,
  },
  {
    tagName: '퍼포먼스',
    blackIcon: performanceBlack,
    primaryIcon: performancePrimary,
  },
  {
    tagName: '스타일',
    blackIcon: styleBlack,
    primaryIcon: stylePrimary,
  },
];

interface TagProps {
  tag: string;
  setTag: React.Dispatch<React.SetStateAction<string>>;
  category: string;
  setPage: React.Dispatch<React.SetStateAction<number>>;
}

function Tag({ tag, setTag, category, setPage }: TagProps) {
  return (
    <div className='h-16 max-w-5xl mx-auto flex gap-2 items-center border-b border-grey-700'>
      {TagData.map(item => {
        if (category === '추가 옵션' && item.tagName === '대표') return;
        return (
          <TagButton
            {...item}
            tag={tag}
            setTag={setTag}
            key={item.tagName}
            setPage={setPage}
          />
        );
      })}
    </div>
  );
}

export default Tag;
