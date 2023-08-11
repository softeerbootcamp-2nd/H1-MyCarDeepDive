import { useState } from 'react';
import { useParams } from 'react-router-dom';
import usePrevious from '@/hooks/usePrevious';
import ResultPage from './ResultPage';
import QuestionPage from './QuestionPage';

function RecommendPage() {
  const { status, step } = useParams();
  const prevStep = usePrevious(step);
  const [age, setAge] = useState('20대');
  const [lifeStyle, setLifeStyle] = useState('');
  const [myLifeStyle, setMyLifeStyle] = useState({
    drivingExperience: '1년 이하',
    numberOfFamilyMembers: '1인',
    purpose: '',
    value: '',
    budget: '6900',
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

  if (step === undefined) return null;
  if (status === 'result') return <ResultPage step={step} />;
  return (
    <QuestionPage
      step={step}
      prevStep={prevStep}
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
