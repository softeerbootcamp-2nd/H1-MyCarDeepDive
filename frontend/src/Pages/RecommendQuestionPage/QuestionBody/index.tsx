import RadioGroup from '@/Components/RadioGroup';
import LifeStyleRadioGroup from '../LifeStyleRadioGroup';

interface QuestionBodyProps {
  step: number;
  ageQuestionList: string[];
  age: string;
  lifeStyle: string;
  ageHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
  lifeStyleHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

function QuestionBody({
  step,
  ageQuestionList,
  age,
  lifeStyle,
  ageHandler,
  lifeStyleHandler,
}: QuestionBodyProps) {
  const question =
    step === 1 ? (
      <RadioGroup
        data={ageQuestionList}
        name={'age'}
        value={age}
        onChangeHandler={ageHandler}
      />
    ) : (
      <LifeStyleRadioGroup
        value={lifeStyle}
        onChangeHandler={lifeStyleHandler}
      />
    );

  return <>{question}</>;
}

export default QuestionBody;
