import { RecommendQuestionPageProps } from '@/global/type';
import RecommendQuestionPageWrapper from './RecommendQuestionPageWrapper';
import RecommendQuestionWrapper from './RecommendQuestionWrapper';
import QuestionTitle from './QuestionTitle';
import NextStepButton from './NextStepButton';
import ProgressBar from './ProgressBar';
import QuestionBody from './QuestionBody';
import DetailQuestionButton from './additionQuestionLink';
import QuestionSubTitle from './QuestionSubTitle';

function RecommendQuestionPage({
  step,
  prevStep,
  lifeStyle,
  age,
  myLifeStyle,
  ageHandler,
  lifeStyleHandler,
  myLifeStyleHandler,
}: RecommendQuestionPageProps) {
  return (
    <RecommendQuestionPageWrapper>
      <ProgressBar step={step} prevStep={prevStep} />
      <RecommendQuestionWrapper>
        <QuestionTitle step={step} />
        <QuestionSubTitle step={step} />
        <DetailQuestionButton step={step} />
        <QuestionBody
          step={step}
          age={age}
          lifeStyle={lifeStyle}
          myLifeStyle={myLifeStyle}
          ageHandler={ageHandler}
          lifeStyleHandler={lifeStyleHandler}
          myLifeStyleHandler={myLifeStyleHandler}
        />
        <NextStepButton
          step={step}
          lifeStyle={lifeStyle}
          myLifeStyle={myLifeStyle}
        />
      </RecommendQuestionWrapper>
    </RecommendQuestionPageWrapper>
  );
}

export default RecommendQuestionPage;
