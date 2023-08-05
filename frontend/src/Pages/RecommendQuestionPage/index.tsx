import { useState } from 'react';
import { useParams } from 'react-router-dom';
import { ageQuestionList } from '@/global/data';
import RecommendQuestionPageWrapper from './RecommendQuestionPageWrapper';
import RecommendQuestionWrapper from './RecommendQuestionWrapper';
import QuestionTitle from './QuestionTitle';
import NextStepButton from './NextStepButton';
import ProgressBar from './ProgressBar';
import QuestionBody from './QuestionBody';
import DetailQuestionButton from './DetailQuestionButton';

function RecommendQuestionPage() {
  const step = useParams().step;
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

  if (step === undefined) return null;
  return (
    <RecommendQuestionPageWrapper>
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
        <NextStepButton step={step} lifeStyle={lifeStyle} />
      </RecommendQuestionWrapper>
    </RecommendQuestionPageWrapper>
  );
}

export default RecommendQuestionPage;
