import { useEffect, useState } from 'react';
import QuestionTitle from '../Components/RecommendQuestionPage/QuestionTitle';
import { ageQuestionList } from '../global/constants';
import NextStepButton from '../Components/RecommendQuestionPage/NextStepButton';
import ProgressBar from '../Components/RecommendQuestionPage/ProgressBar';
import RecommendQuestionWrapper from '../Components/RecommendQuestionPage/RecommendQuestionWrapper';
import { useNavigate } from 'react-router-dom';
import QuestionBody from '../Components/RecommendQuestionPage/QuestionBody';
import DetailQuestionButton from '../Components/RecommendQuestionPage/DetailQuestionButton';

function RecommendQuestionPage() {
  const navigation = useNavigate();
  const [step, setStep] = useState(1);
  const [age, setAge] = useState('20대');
  const [lifeStyle, setLifeStyle] = useState('');

  const ageHandler = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    setAge(target.value);
  };
  const lifeStyleHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    setLifeStyle(target.value);
  };

  useEffect(() => {
    if (step === 3) return navigation('/recommend/result');

    if (step === 2) {
      history.pushState(null, '', '');
      window.onpopstate = () => setStep(1);
    }
  }, [step, navigation]);

  return (
    <div className='pt-[92px] h-screen relative'>
      <ProgressBar step={step} />
      <RecommendQuestionWrapper>
        <QuestionTitle step={step} />
        <DetailQuestionButton step={step} />
        <QuestionBody
          step={step}
          ageQuestionList={ageQuestionList}
          age={age}
          lifeStyle={lifeStyle}
          ageHandler={ageHandler}
          lifeStyleHandler={lifeStyleHandler}
        />
        <NextStepButton step={step} setStep={setStep} lifeStyle={lifeStyle} />
      </RecommendQuestionWrapper>
    </div>
  );
}

export default RecommendQuestionPage;
