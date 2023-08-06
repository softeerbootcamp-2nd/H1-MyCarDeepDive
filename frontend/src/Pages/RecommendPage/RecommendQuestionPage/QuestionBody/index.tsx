import RadioGroup from '@/Components/RadioGroup';
import LifeStyleRadioGroup from './LifeStyleRadioGroup';
import { additionQuestionList, ageQuestionList } from '@/global/data';

interface QuestionBodyProps {
  step: string;
  age: string;
  lifeStyle: string;
  myLifeStyle: {
    drivingExperience: string;
    numberOfFamilyMembers: string;
    purpose: string;
    value: string;
  };
  ageHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
  lifeStyleHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
  myLifeStyleHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

function QuestionBody({
  step,
  age,
  lifeStyle,
  myLifeStyle,
  ageHandler,
  lifeStyleHandler,
  myLifeStyleHandler,
}: QuestionBodyProps) {
  const { drivingExperience, numberOfFamilyMembers, purpose, value } =
    myLifeStyle;

  const {
    drivingExperienceList,
    numberOfFamilyMembersList,
    purposeList,
    valueList,
  } = additionQuestionList;
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
        <RadioGroup
          data={drivingExperienceList}
          name={'drivingExperience'}
          value={drivingExperience}
          onChangeHandler={myLifeStyleHandler}
        />
        <RadioGroup
          data={numberOfFamilyMembersList}
          name={'numberOfFamilyMembers'}
          value={numberOfFamilyMembers}
          onChangeHandler={myLifeStyleHandler}
        />
        <RadioGroup
          data={purposeList}
          name={'purpose'}
          value={purpose}
          onChangeHandler={myLifeStyleHandler}
        />
        <RadioGroup
          data={valueList}
          name={'value'}
          value={value}
          onChangeHandler={myLifeStyleHandler}
        />
      </>
    ) : (
      ''
    );

  return <>{question}</>;
}

export default QuestionBody;
