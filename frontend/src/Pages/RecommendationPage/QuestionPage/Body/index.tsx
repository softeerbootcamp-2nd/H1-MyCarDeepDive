import RadioGroup from '@/Components/RadioGroup';
import LifeStyleRadio from './LifeStyleRadio';
import { lifeStyleAdditionQuestionList, ageQuestionList } from '@/global/data';
import Title from './Title';
import { Fragment, useContext } from 'react';
import Budget from './Budget';
import { QuestionContext } from '@/context/QuestionProvider';
import {
  SET_AGE,
  SET_BUDGET,
  SET_DRIVINGEXPERIENCE,
  SET_LIFESTYLE,
  SET_LIFEVALUE,
  SET_NUMBEROFFAMILYMEMBERS,
  SET_PURPOSE,
} from '@/context/QuestionProvider/type';
import { useParams } from 'react-router-dom';

function Body() {
  const { step } = useParams();
  const { age, myLifeStyle, questionDispatch } = useContext(QuestionContext);
  const ageHandler = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    questionDispatch({ type: SET_AGE, age: target.value });
  };
  const lifeStyleHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    questionDispatch({ type: SET_LIFESTYLE, lifeStyle: target.value });
  };
  const drivingExperienceHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    questionDispatch({
      type: SET_DRIVINGEXPERIENCE,
      drivingExperience: target.value,
    });
  };
  const budgetHandler = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    questionDispatch({ type: SET_BUDGET, budget: target.value });
  };
  const lifeValueHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    questionDispatch({ type: SET_LIFEVALUE, lifeValue: target.value });
  };
  const numberOfFamilyMembersHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    questionDispatch({
      type: SET_NUMBEROFFAMILYMEMBERS,
      numberOfFamilyMembers: target.value,
    });
  };
  const purposeHandler = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    questionDispatch({
      type: SET_PURPOSE,
      purpose: target.value,
    });
  };
  const handlerMap: Record<
    string,
    (e: React.ChangeEvent<HTMLInputElement>) => void
  > = {
    age: ageHandler,
    lifeStyle: lifeStyleHandler,
    lifeValue: lifeValueHandler,
    drivingExperience: drivingExperienceHandler,
    budget: budgetHandler,
    numberOfFamilyMembers: numberOfFamilyMembersHandler,
    purpose: purposeHandler,
  };

  let content = null;

  switch (step) {
    case '1':
      content = (
        <RadioGroup
          data={ageQuestionList}
          name={'age'}
          selectedValue={age}
          onChangeHandler={ageHandler}
        />
      );
      break;
    case '2':
      content = <LifeStyleRadio />;
      break;
    case 'addition':
      content = (
        <>
          {lifeStyleAdditionQuestionList.map((additionQuestion, index) => {
            const { question, answerList, value } = additionQuestion;
            const selectedValue =
              myLifeStyle[value as keyof typeof myLifeStyle];

            return (
              <Fragment key={index}>
                <Title title={question} />
                <RadioGroup
                  data={answerList}
                  name={value}
                  selectedValue={selectedValue}
                  onChangeHandler={handlerMap[value]}
                />
              </Fragment>
            );
          })}
          <Title title={'최대 예산을 알려주세요.'} />
          <Budget />
        </>
      );
      break;
    default:
      break;
  }

  return <>{content}</>;
}

export default Body;
