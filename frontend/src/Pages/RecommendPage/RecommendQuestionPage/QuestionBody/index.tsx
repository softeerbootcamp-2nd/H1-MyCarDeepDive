import RadioGroup from '@/Components/RadioGroup';
import LifeStyleRadioGroup from './LifeStyleRadioGroup';
import { lifeStyleAdditionQuestionList, ageQuestionList } from '@/global/data';
import { QuestionBodyProps } from '@/global/type';

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
      lifeStyleAdditionQuestionList.map((additionQuestion, index) => (
        <RadioGroup
          key={index}
          data={additionQuestion.answerList}
          name={additionQuestion.value}
          value={
            myLifeStyle[additionQuestion.value as keyof typeof myLifeStyle]
          }
          onChangeHandler={myLifeStyleHandler}
        />
      ))
    ) : (
      ''
    );

  return <>{question}</>;
}

export default QuestionBody;
