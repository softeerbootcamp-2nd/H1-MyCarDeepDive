import { useContext, useState } from 'react';
import { lifeStyleQuestionList } from '@/global/data';
import Selected from './Selected';
import Unselected from './Unselected';
import LifeStyleModal from '../../LifeStyleModal';
import { QuestionContext } from '@/context/QuestionProvider';

function LifeStyleRadio() {
  const { lifeStyle } = useContext(QuestionContext);
  const [showLifeStyleModal, setShowLifeStyleModal] = useState(false);

  const result = lifeStyleQuestionList.map(item => {
    return item.value === lifeStyle ? (
      <Selected
        key={item.value}
        data={item}
        setShowLifeStyleModal={setShowLifeStyleModal}
      />
    ) : (
      <Unselected
        key={item.value}
        data={item}
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
