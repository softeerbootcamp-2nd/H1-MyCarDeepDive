import LifeStyleRadioSelected from './LifeStyleRadioSelected';
import LifeStyleRadioUnselected from './LifeStyleRadioUnselected';
import { lifeStyleQuestionList } from '../../../global/constants';
import LifeStyleModal from '../LifeStyleModal';
import { useState } from 'react';

type LifeStyleRadioGroupProps = {
  value: string;
  onChangeHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
};

function LifeStyleRadioGroup({
  value,
  onChangeHandler,
}: LifeStyleRadioGroupProps) {
  const [showLifeStyleModal, setShowLifeStyleModal] = useState(false);

  const result = lifeStyleQuestionList.map(item => {
    return item.value === value ? (
      <LifeStyleRadioSelected
        key={item.value}
        data={item}
        onChangeHandler={onChangeHandler}
        setShowLifeStyleModal={setShowLifeStyleModal}
      />
    ) : (
      <LifeStyleRadioUnselected
        key={item.value}
        data={item}
        onChangeHandler={onChangeHandler}
        setShowLifeStyleModal={setShowLifeStyleModal}
      />
    );
  });

  return (
    <>
      <div className='grid grid-cols-2 gap-4'>{result}</div>
      <LifeStyleModal
        showModal={showLifeStyleModal}
        setShowModal={setShowLifeStyleModal}
      />
    </>
  );
}

export default LifeStyleRadioGroup;
