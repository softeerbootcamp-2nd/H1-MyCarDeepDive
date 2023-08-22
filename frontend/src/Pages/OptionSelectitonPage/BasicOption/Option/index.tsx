import { useContext } from 'react';
import { OptionContext } from '@/context/OptionProvider';
import { SET_OPTIONID, SET_PACKAGE } from '@/context/OptionProvider/type';
import moreInfo from '@/assets/icon/more-info.svg';

interface OptionProps {
  basic_option_id: number;
  option_img_url: string;
  option_name: string;
  tag_list: {
    tag_id: number;
    tag_name: string;
  }[];
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
}

function Option({
  basic_option_id,
  option_img_url,
  option_name,
  setShowOptionModal,
}: OptionProps) {
  const { optionDispatch } = useContext(OptionContext);

  const showMoreInfo = () => {
    optionDispatch({
      type: SET_OPTIONID,
      optionId: basic_option_id,
    });
    optionDispatch({
      type: SET_PACKAGE,
      packageOption: false,
    });

    setShowOptionModal(true);
  };

  return (
    <div className='w-[244px] mb-11'>
      <div className='w-full h-[130.71px] relative'>
        <img
          src={'https://' + option_img_url}
          alt={option_name}
          className='w-full h-full backdrop: rounded absolute top-0 left-0'
        />
      </div>
      <div className='mt-3 flex justify-between'>
        <div className='w-2/3 font-h4-medium text-grey-0'>{option_name}</div>
        <div
          className='w-1/3 h-[22px] font-body4-regular whitespace-nowrap text-secondary flex cursor-pointer'
          onClick={showMoreInfo}
        >
          더 알아보기
          <img src={moreInfo} alt='더 알아보기' className='w-4 h-full' />
        </div>
      </div>
    </div>
  );
}

export default Option;
