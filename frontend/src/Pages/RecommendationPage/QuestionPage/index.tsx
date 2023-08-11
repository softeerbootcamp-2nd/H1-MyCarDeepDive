import { RecommendQuestionPageProps } from '@/global/type';
import RecommendQuestionPageWrapper from './RecommendQuestionPageWrapper';
import RecommendQuestionWrapper from './RecommendQuestionWrapper';
import Title from './Title';
import NextStepButton from './NextStepButton';
import ProgressBar from './ProgressBar';
import Body from './Body';
import SubTitle from './SubTitle';
import LifeStyleLink from './LifeStyleLink';

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
        <Title step={step} />
        <SubTitle step={step} />
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
