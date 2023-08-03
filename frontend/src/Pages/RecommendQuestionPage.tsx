import { useEffect, useState } from 'react';
import RadioGroup from '../Components/Common/RadioGroup/RadioGroup';
import QuestionTitle from '../Components/RecommendQuestionPage/QuestionTitle';
import { ageQuestionList } from '../global/constants';
import NextStepButton from '../Components/RecommendQuestionPage/NextStepButton';
import ProgressBar from '../Components/RecommendQuestionPage/ProgressBar';
import RecommendQuestionWrapper from '../Components/RecommendQuestionPage/RecommendQuestionWrapper';

function RecommendQuestionPage() {
  const [step, setStep] = useState(1);
  const [age, setAge] = useState('20대');

  const ageHandler = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    setAge(target.value);
  };

  useEffect(() => {
    if (step === 2) {
      history.pushState(null, '', '');
      window.onpopstate = () => setStep(1);
    }
  }, [step]);

  return (
    <div className='pt-[92px] h-screen relative'>
      <ProgressBar step={step} />
      <RecommendQuestionWrapper>
        <QuestionTitle step={step} />
        <RadioGroup
          data={ageQuestionList}
          name={'age'}
          value={age}
          onChangeHandler={ageHandler}
        />
        <NextStepButton step={step} setStep={setStep} />
      </RecommendQuestionWrapper>
    </div>
  );
}

export default RecommendQuestionPage;
