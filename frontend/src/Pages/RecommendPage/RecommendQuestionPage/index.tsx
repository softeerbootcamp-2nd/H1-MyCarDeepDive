import { ageQuestionList } from '@/global/data';
import { RecommendQuestionPageProps } from '@/global/type';
import RecommendQuestionPageWrapper from './RecommendQuestionPageWrapper';
import RecommendQuestionWrapper from './RecommendQuestionWrapper';
import QuestionTitle from './QuestionTitle';
import NextStepButton from './NextStepButton';
import ProgressBar from './ProgressBar';
import QuestionBody from './QuestionBody';
import DetailQuestionButton from './DetailQuestionButton';

function RecommendQuestionPage({
  step,
  lifeStyle,
  age,
  ageHandler,
  lifeStyleHandler,
}: RecommendQuestionPageProps) {
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
