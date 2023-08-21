import { useEffect } from 'react';
import Option from './Option';
import getBasicOptions, {
  getBasicOptionsType,
} from '@/api/option/getBasicOptions';

interface BasicOptionProps {
  page: number;
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
  setMaxPage: React.Dispatch<React.SetStateAction<number>>;
  setTotalCount: React.Dispatch<React.SetStateAction<number>>;
}

function BasicOption({
  page,
  setShowOptionModal,
  setMaxPage,
  setTotalCount,
}: BasicOptionProps) {
  const basicOptionData: getBasicOptionsType | undefined = getBasicOptions();

  useEffect(() => {
    if (basicOptionData === undefined) return;

    console.log(basicOptionData);
    setMaxPage(Math.ceil(basicOptionData.data.length / 12));
    setTotalCount(basicOptionData.data.length);
  }, [basicOptionData]);

  if (basicOptionData === undefined) return null;
  return (
    <div className='grid grid-cols-4 gap-4 max-w-5xl mx-auto'>
      {basicOptionData.data
        .slice((page - 1) * 12, page * 12)
        .map((item, idx) => {
          return (
            <Option
              {...item}
              key={idx}
              setShowOptionModal={setShowOptionModal}
            />
          );
        })}
    </div>
  );
}

export default BasicOption;
