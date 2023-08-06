import RadioGroup from '@/Components/RadioGroup';
import LifeStyleRadioGroup from './LifeStyleRadioGroup';
import { lifeStyleAdditionQuestionList, ageQuestionList } from '@/global/data';
import { QuestionBodyProps } from '@/global/type';
import AdditionQuestionTitle from './AdditionQuestionTitle';
import { Fragment } from 'react';

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
        {lifeStyleAdditionQuestionList.map((additionQuestion, index) => (
          <Fragment key={index}>
            <AdditionQuestionTitle title={additionQuestion.question} />
            <RadioGroup
              data={additionQuestion.answerList}
              name={additionQuestion.value}
              value={
                myLifeStyle[additionQuestion.value as keyof typeof myLifeStyle]
              }
              onChangeHandler={myLifeStyleHandler}
            />
          </Fragment>
        ))}
        <AdditionQuestionTitle title={'최대 예산을 알려주세요.'} />

        <p className='mt-[38px] mb-[34px] font-h2-medium text-grey-50'>
          <span className='text-[24px] leading-[26px] tracking-[-0.2px]'>
            4,200
          </span>
          <span className='font-h5-regular'>
            <span className='text-[24px] leading-[26px] tracking-[-0.2px]'>
              만원
            </span>
            <span className='text-[22px] leading-[26px] tracking-[-0.2px] mx-2'>
              ~
            </span>
          </span>{' '}
          <span className='font-h2-medium'>
            <span className='text-[24px] leading-[26px] tracking-[-0.2px]'>
              6,900
            </span>
          </span>
          <span className='font-h5-regular'>
            <span className='text-[24px] leading-[26px] tracking-[-0.2px]'>
              만원
            </span>
          </span>
        </p>

        <input
          className='w-full mb-[88p] slider'
          type='range'
          min={4200}
          max={6900}
          step={300}
          name='budget'
          onChange={myLifeStyleHandler}
        />
      </>
    ) : null;

  return <>{question}</>;
}

export default QuestionBody;
