import { useEffect } from 'react';
import Option from './Option';
import getAdditionalOptions, {
  getAdditionalOptionsType,
} from '@/api/option/getAdditionalOptions';

interface AdditionalOptionProps {
  page: number;
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
  setMaxPage: React.Dispatch<React.SetStateAction<number>>;
  setTotalCount: React.Dispatch<React.SetStateAction<number>>;
}

function AdditionalOption({
  page,
  setShowOptionModal,
  setMaxPage,
  setTotalCount,
}: AdditionalOptionProps) {
  const additionalOptionData: getAdditionalOptionsType | undefined =
    getAdditionalOptions();

  useEffect(() => {
    if (!additionalOptionData) return;

    const additionalOptionDataLength =
      additionalOptionData.data.optionPackageList.length +
      additionalOptionData.data.additionalOptionList.length;
    setMaxPage(Math.ceil(additionalOptionDataLength / 8));
    setTotalCount(additionalOptionDataLength);
  }, [additionalOptionData]);

  if (!additionalOptionData) return null;
  return (
    <div className='grid grid-cols-4 gap-4 max-w-5xl mx-auto'>
      {[
        ...additionalOptionData.data.optionPackageList,
        ...additionalOptionData.data.additionalOptionList,
      ]
        .slice((page - 1) * 8, page * 8)
        .map(item => {
          return (
            <Option
              {...item}
              key={item.option_name}
              setShowOptionModal={setShowOptionModal}
            />
          );
        })}
    </div>
  );
}

export default AdditionalOption;
