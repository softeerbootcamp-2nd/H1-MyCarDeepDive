import { useState } from 'react';
import { useParams } from 'react-router-dom';
import RecommendResultPage from './RecommendResultPage';
import RecommendQuestionPage from './RecommendQuestionPage';

function RecommendPage() {
  const { status, step } = useParams();
  const [age, setAge] = useState('20대');
  const [lifeStyle, setLifeStyle] = useState('');
  const [myLifeStyle, setMyLifeStyle] = useState({
    drivingExperience: '1년 이하',
    numberOfFamilyMembers: '1인',
    purpose: '',
    value: '',
  });

  const ageHandler = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    setAge(target.value);
  };
  const lifeStyleHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    setLifeStyle(lifeStyle === target.value ? '' : target.value);
  };
  const myLifeStyleHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = target;
    setMyLifeStyle({ ...myLifeStyle, [name]: value });
  };

  if (status === 'result') return <RecommendResultPage />;
  if (step === undefined) return null;
  return (
    <RecommendQuestionPage
      step={step}
      age={age}
      lifeStyle={lifeStyle}
      myLifeStyle={myLifeStyle}
      ageHandler={ageHandler}
      lifeStyleHandler={lifeStyleHandler}
      myLifeStyleHandler={myLifeStyleHandler}
    />
  );
}

export default RecommendPage;
