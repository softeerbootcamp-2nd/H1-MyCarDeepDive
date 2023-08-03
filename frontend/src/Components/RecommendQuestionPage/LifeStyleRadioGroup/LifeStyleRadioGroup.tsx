import LifeStyleRadioSelected from './LifeStyleRadioSelected';
import LifeStyleRadioUnselected from './LifeStyleRadioUnselected';
import { lifeStyleQuestionList } from '../../../global/constants';

type LifeStyleRadioGroupProps = {
  value: string;
  onChangeHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
};

function LifeStyleRadioGroup({
  value,
  onChangeHandler,
}: LifeStyleRadioGroupProps) {
  const result = lifeStyleQuestionList.map(item => {
    return item.value === value ? (
      <LifeStyleRadioSelected
        key={item.value}
        data={item}
        onChangeHandler={onChangeHandler}
      />
    ) : (
      <LifeStyleRadioUnselected
        key={item.value}
        data={item}
        onChangeHandler={onChangeHandler}
      />
    );
  });

  return <div className='mt-16 grid grid-cols-2 gap-4'>{result}</div>;
}

export default LifeStyleRadioGroup;
