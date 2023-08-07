import RadioGroup from '@/Components/RadioGroup';
import LifeStyleRadioGroup from './LifeStyleRadioGroup';
import { lifeStyleAdditionQuestionList, ageQuestionList } from '@/global/data';
import { QuestionBodyProps } from '@/global/type';
import AdditionQuestionTitle from './AdditionQuestionTitle';
import { Fragment } from 'react';
import AdditionQuestionBudgetRange from './AdditionQuestionBudget';

function QuestionBody({
  step,
  age,
  lifeStyle,
  myLifeStyle,
  ageHandler,
  lifeStyleHandler,
  myLifeStyleHandler,
}: QuestionBodyProps) {
  const question =
    step === '1' ? (
      <RadioGroup
        data={ageQuestionList}
        name={'age'}
        value={age}
        onChangeHandler={ageHandler}
      />
    ) : step === '2' ? (
      <LifeStyleRadioGroup
        value={lifeStyle}
        onChangeHandler={lifeStyleHandler}
      />
    ) : step === 'addition' ? (
      <>
        {lifeStyleAdditionQuestionList.map((additionQuestion, index) => {
          const { question, answerList, value } = additionQuestion;
          const radioValue =
            myLifeStyle[additionQuestion.value as keyof typeof myLifeStyle];
          return (
            <Fragment key={index}>
              <AdditionQuestionTitle title={question} />
              <RadioGroup
                data={answerList}
                name={value}
                value={radioValue}
                onChangeHandler={myLifeStyleHandler}
              />
            </Fragment>
          );
        })}
        <AdditionQuestionTitle title={'최대 예산을 알려주세요.'} />
        <AdditionQuestionBudgetRange
          budget={myLifeStyle.budget}
          myLifeStyleHandler={myLifeStyleHandler}
        />
      </>
    ) : null;

  return <>{question}</>;
}

export default QuestionBody;
