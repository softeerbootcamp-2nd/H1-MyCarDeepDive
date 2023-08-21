import RecommendQuestionPageWrapper from './RecommendQuestionPageWrapper';
import RecommendQuestionWrapper from './RecommendQuestionWrapper';
import Title from './Title';
import NextStepButton from './NextStepButton';
import ProgressBar from './ProgressBar';
import Body from './Body';
import SubTitle from './SubTitle';
import LifeStyleLink from './LifeStyleLink';

function QuestionPage() {
  return (
    <RecommendQuestionPageWrapper>
      <ProgressBar />
      <RecommendQuestionWrapper>
        <Title />
        <SubTitle />
        <LifeStyleLink />
        <Body />
        <NextStepButton />
      </RecommendQuestionWrapper>
    </RecommendQuestionPageWrapper>
  );
}

export default QuestionPage;
