import moreInfo from '@/assets/icon/more-info.svg';
import SelectedButton from './SelectedButton';
import UnSelectedButton from './UnSelectedButton';
import { useContext, useEffect, useState } from 'react';
import { OptionContext } from '@/context/OptionProvider';
import { SET_OPTIONID, SET_PACKAGE } from '@/context/OptionProvider/type';
import { priceToString } from '@/utils';
import { CarContext } from '@/context/CarProvider';

interface SelectedProps {
  package_option_id?: number;
  option_img_url: string;
  option_select_rate?: number;
  option_name: string;
  option_summary: string;
  tag_list: {
    tag_id: number;
    tag_name: string;
  }[];
  badge_name: string;
  price: number;
  additional_option_id_list?: number[];
  additional_option_id?: number;
  select_rate?: number;
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
}

function Option({
  package_option_id,
  option_img_url,
  option_select_rate,
  option_name,
  option_summary,
  badge_name,
  price,
  additional_option_id_list,
  additional_option_id,
  select_rate,
  setShowOptionModal,
}: SelectedProps) {
  const { optionIdList } = useContext(CarContext);
  const { optionDispatch } = useContext(OptionContext);
  const [optionIdLists, setOptionIdLists] = useState<number[]>();

  const showMoreInfo = () => {
    if (package_option_id) {
      optionDispatch({
        type: SET_OPTIONID,
        optionId: package_option_id || 0,
      });
      optionDispatch({
        type: SET_PACKAGE,
        packageOption: true,
      });
    } else {
      optionDispatch({
        type: SET_OPTIONID,
        optionId: additional_option_id || 0,
      });
      optionDispatch({
        type: SET_PACKAGE,
        packageOption: false,
      });
    }

    setShowOptionModal(true);
  };

  const checkSelected = () => {
    if (additional_option_id_list)
      return additional_option_id_list.every(value =>
        optionIdList.includes(value),
      );
    if (additional_option_id)
      return optionIdList.includes(additional_option_id);
  };

  useEffect(() => {
    if (additional_option_id_list)
      setOptionIdLists([...additional_option_id_list]);
    if (additional_option_id) setOptionIdLists([additional_option_id]);
  }, [additional_option_id_list, additional_option_id]);

  return (
    <div className='w-[244px] mb-11'>
      <div className='w-full h-[130.71px] relative'>
        <img
          src={'https://' + option_img_url}
          alt={option_name}
          className='w-full rounded absolute top-0 left-0'
        />
        {option_select_rate && option_select_rate >= 60 && (
          <div className='absolute left-0 bottom-0 w-full py-2 pl-3 bg-secondary bg-opacity-60 rounded-lg font-caption1-regular text-grey-1000'>
            {`${option_select_rate}%의 사용자가 선택했습니다.`}
          </div>
        )}
        {select_rate && select_rate >= 60 && (
          <div className='absolute left-0 bottom-0 w-full py-2 pl-3 bg-secondary bg-opacity-60 rounded-lg font-caption1-regular text-grey-1000'>
            {`${select_rate}%의 사용자가 선택했습니다.`}
          </div>
        )}
        {badge_name === 'N Performance' && (
          <div className='absolute left-0 top-0 rounded-tl rounded-br bg-[#AE4747] font-caption1-medium px-1.5 py-1'>
            <span className='leading-[12px] text-grey-1000'>N Performance</span>
          </div>
        )}
        {badge_name === 'H Genuine Accessories' && (
          <div className='absolute left-0 top-0 rounded-tl rounded-br bg-[#558AC7] font-caption1-medium px-1.5 py-1'>
            <span className='leading-[12px] text-grey-1000'>
              H Genuine Accessories
            </span>
          </div>
        )}
      </div>
      <div className='mt-3 flex justify-between'>
        <div className='w-2/3 h-[44px] font-h4-medium text-grey-0'>
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
      <div className='mt-1.5 mb-1 h-[44px] font-body4-regular text-grey-300'>
        {option_summary}
      </div>
      <div className='mb-3 font-body3-medium text-grey-100'>{`${priceToString(
        price,
      )}원`}</div>
      {checkSelected() ? (
        <SelectedButton
          optionIdList={optionIdLists}
          optionData={{
            name: option_name,
            price: price,
            imgUrl: option_img_url,
          }}
        />
      ) : (
        <UnSelectedButton
          optionIdList={optionIdLists}
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
