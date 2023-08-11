import RadioGroup from '@/Components/RadioGroup';
import LifeStyleRadio from './LifeStyleRadio';
import { lifeStyleAdditionQuestionList, ageQuestionList } from '@/global/data';
import { QuestionBodyProps } from '@/global/type';
import Title from './Title';
import { Fragment } from 'react';
import Budget from './Budget';

function Body({
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
      <LifeStyleRadio value={lifeStyle} onChangeHandler={lifeStyleHandler} />
    ) : step === 'addition' ? (
      <>
        {lifeStyleAdditionQuestionList.map((additionQuestion, index) => {
          const { question, answerList, value } = additionQuestion;
          const radioValue =
            myLifeStyle[additionQuestion.value as keyof typeof myLifeStyle];
          return (
            <Fragment key={index}>
              <Title title={question} />
              <RadioGroup
                data={answerList}
                name={value}
                value={radioValue}
                onChangeHandler={myLifeStyleHandler}
              />
            </Fragment>
          );
        })}
        <Title title={'최대 예산을 알려주세요.'} />
        <Budget
          budget={myLifeStyle.budget}
          myLifeStyleHandler={myLifeStyleHandler}
        />
      </>
    ) : null;

  return <>{question}</>;
}

export default Body;
