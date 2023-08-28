import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';
import { DELETE_OPTION, DELETE_OPTION_DATA } from '@/context/CarProvider/type';
import checkOptionIcon from '@/assets/icon/white-check-option.svg';

interface Props {
  optionIdList: number[] | undefined;
  optionData: { name: string; price: number; imgUrl: string };
}

function SelectedButton({ optionIdList, optionData }: Props) {
  const { carDispatch } = useContext(CarContext);

  const unSelectOption = () => {
    if (optionIdList === undefined) return;
    carDispatch({ type: DELETE_OPTION, optionIdList: optionIdList });
    carDispatch({ type: DELETE_OPTION_DATA, optionData: optionData });
  };

  return (
    <button
      className='w-[71px] bg-primary font-caption1-medium text-grey-1000 border border-primary flex items-center gap-2 py-1.5 px-3 rounded-full'
      onClick={unSelectOption}
    >
      <img src={checkOptionIcon} alt='check' />
      <span>선택</span>
    </button>
  );
}

export default SelectedButton;
