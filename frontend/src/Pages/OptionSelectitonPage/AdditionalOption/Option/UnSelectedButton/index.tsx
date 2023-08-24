import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';
import { ADD_OPTION, ADD_OPTION_DATA } from '@/context/CarProvider/type';
import checkOptionPrimaryIcon from '@/assets/icon/primary-check-option.svg';

interface Props {
  optionIdList: number[] | undefined;
  optionData: { name: string; price: number };
}

function UnSelectedButton({ optionIdList, optionData }: Props) {
  const { carDispatch } = useContext(CarContext);

  const selectOption = () => {
    if (optionIdList === undefined) return;
    carDispatch({ type: ADD_OPTION, optionIdList: optionIdList });
    carDispatch({ type: ADD_OPTION_DATA, optionData: optionData });
  };

  return (
    <button
      className='w-[71px] bg-grey-1000 font-caption1-medium text-primary border border-primary flex items-center gap-2 py-1.5 px-3 rounded-full'
      onClick={selectOption}
    >
      <img src={checkOptionPrimaryIcon} alt='check' />
      <span>선택</span>
    </button>
  );
}

export default UnSelectedButton;
