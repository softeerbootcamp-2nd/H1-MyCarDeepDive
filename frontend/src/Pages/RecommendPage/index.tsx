import { useState } from 'react';
import { useParams } from 'react-router-dom';
import { ageQuestionList } from '@/global/data';
import RecommendResultPage from './RecommendResultPage';
import RecommendQuestionPage from './RecommendQuestionPage';

function RecommendPage() {
  const { status, step } = useParams();
  const [age, setAge] = useState('20대');
  const [lifeStyle, setLifeStyle] = useState('');

  const ageHandler = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    setAge(target.value);
  };
  const lifeStyleHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    setLifeStyle(lifeStyle === target.value ? '' : target.value);
  };

  if (status === 'result') return <RecommendResultPage />;
  if (step === undefined) return null;
  return (
    <RecommendQuestionPage
      step={step}
      ageQuestionList={ageQuestionList}
      age={age}
      lifeStyle={lifeStyle}
      ageHandler={ageHandler}
      lifeStyleHandler={lifeStyleHandler}
    />
  );
}

export default RecommendPage;
