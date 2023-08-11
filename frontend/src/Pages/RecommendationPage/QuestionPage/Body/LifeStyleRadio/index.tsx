import { useState } from 'react';
import { lifeStyleQuestionList } from '@/global/data';
import Selected from './Selected';
import Unselected from './Unselected';
import LifeStyleModal from '../../LifeStyleModal';

interface LifeStyleRadioGroupProps {
  value: string;
  onChangeHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

function LifeStyleRadio({ value, onChangeHandler }: LifeStyleRadioGroupProps) {
  const [showLifeStyleModal, setShowLifeStyleModal] = useState(false);

  const result = lifeStyleQuestionList.map(item => {
    return item.value === value ? (
      <Selected
        key={item.value}
        data={item}
        onChangeHandler={onChangeHandler}
        setShowLifeStyleModal={setShowLifeStyleModal}
      />
    ) : (
      <Unselected
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

export default LifeStyleRadio;
