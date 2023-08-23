import { useEffect, useState } from 'react';
import Option from './Option';
import getBasicOptions, {
  getBasicOptionsType,
} from '@/api/option/getBasicOptions';

interface BasicOptionType {
  basic_option_id: number;
  option_img_url: string;
  option_name: string;
  tag_list: {
    tag_id: number;
    tag_name: string;
  }[];
}

interface BasicOptionProps {
  page: number;
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
  setMaxPage: React.Dispatch<React.SetStateAction<number>>;
  setTotalCount: React.Dispatch<React.SetStateAction<number>>;
  tag: string;
}

function BasicOption({
  page,
  setShowOptionModal,
  setMaxPage,
  setTotalCount,
  tag,
}: BasicOptionProps) {
  const basicOptionData: getBasicOptionsType | undefined = getBasicOptions();
  const [basicOptionFilter, setBasicOptionFilter] = useState<
    BasicOptionType[] | undefined
  >();

  useEffect(() => {
    if (basicOptionData === undefined) return;

    const filteredData =
      tag === '전체'
        ? basicOptionData.data
        : basicOptionData.data.filter(item => {
            return item.tag_list.some(tagItem =>
              tagItem.tag_name.includes(tag === '대표' ? 'MAIN 대표' : tag),
            );
          });

    setBasicOptionFilter(filteredData);

    setMaxPage(Math.ceil(filteredData.length / 12));
    setTotalCount(filteredData.length);
  }, [basicOptionData, tag]);

  if (basicOptionFilter === undefined) return null;
  return (
    <div className='grid grid-cols-4 gap-4 max-w-5xl mx-auto'>
      {basicOptionFilter.slice((page - 1) * 12, page * 12).map((item, idx) => {
        return (
          <Option {...item} key={idx} setShowOptionModal={setShowOptionModal} />
        );
      })}
    </div>
  );
}

export default BasicOption;
