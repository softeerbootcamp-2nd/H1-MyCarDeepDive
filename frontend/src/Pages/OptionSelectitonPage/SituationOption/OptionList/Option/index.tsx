import { useContext } from 'react';
import moreInfo from '@/assets/icon/more-info.svg';
import SelectedButton from '@/Pages/OptionSelectitonPage/AdditionalOption/Option/SelectedButton';
import UnSelectedButton from '@/Pages/OptionSelectitonPage/AdditionalOption/Option/UnSelectedButton';
import { OptionContext } from '@/context/OptionProvider';
import { SET_OPTIONID, SET_PACKAGE } from '@/context/OptionProvider/type';
import { priceToString, truncateText } from '@/utils';
import { CarContext } from '@/context/CarProvider';

interface SelectedProps {
  additional_option_id: number;
  option_name: string;
  option_description: string;
  option_img_url: string;
  price: number;
  position_x: number;
  position_y: number;
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
}

function Option({
  additional_option_id,
  option_name,
  option_description,
  option_img_url,
  price,
  setShowOptionModal,
}: SelectedProps) {
  const { optionIdList } = useContext(CarContext);
  const { optionDispatch } = useContext(OptionContext);

  const showMoreInfo = () => {
    optionDispatch({
      type: SET_OPTIONID,
      optionId: additional_option_id || 0,
    });
    optionDispatch({
      type: SET_PACKAGE,
      packageOption: false,
    });

    setShowOptionModal(true);
  };

  const checkSelected = () => {
    return optionIdList.includes(additional_option_id);
  };

  return (
    <div className='w-[244px] mb-11'>
      <div className='w-full h-[130.71px] relative'>
        <img
          src={'https://' + option_img_url}
          alt={option_name}
          className='w-full rounded absolute top-0 left-0'
        />
      </div>
      <div className='mt-3 flex justify-between'>
        <div className='w-2/3 h-[66px] font-h4-medium text-grey-0'>
          {option_name}
        </div>
        <div
          className='w-1/3 h-[22px] font-body4-regular whitespace-nowrap text-secondary flex cursor-pointer'
          onClick={showMoreInfo}
        >
          더 알아보기
          <img src={moreInfo} alt='더 알아보기' className='w-4 h-full' />
        </div>
      </div>
      <div className='mt-1.5 mb-1 h-[66px] font-body4-regular text-grey-300'>
        {truncateText(option_description, 70)}
      </div>
      <div className='mb-3 font-body3-medium text-grey-100'>{`${priceToString(
        price,
      )}원`}</div>
      {checkSelected() ? (
        <SelectedButton
          optionIdList={[additional_option_id]}
          optionData={{
            name: option_name,
            price: price,
            imgUrl: option_img_url,
          }}
        />
      ) : (
        <UnSelectedButton
          optionIdList={[additional_option_id]}
          optionData={{
            name: option_name,
            price: price,
            imgUrl: option_img_url,
          }}
        />
      )}
    </div>
  );
}

export default Option;
