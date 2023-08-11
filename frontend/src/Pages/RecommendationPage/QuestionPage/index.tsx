import { RecommendQuestionPageProps } from '@/global/type';
import RecommendQuestionPageWrapper from './RecommendQuestionPageWrapper';
import RecommendQuestionWrapper from './RecommendQuestionWrapper';
import QuestionTitle from './QuestionTitle';
import NextStepButton from './NextStepButton';
import ProgressBar from './ProgressBar';
import Body from './Body';
import LifeStyleLink from './LifeStyleLink';
import QuestionSubTitle from './QuestionSubTitle';

function QuestionPage({
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
        <LifeStyleLink step={step} />
        <Body
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

export default QuestionPage;
