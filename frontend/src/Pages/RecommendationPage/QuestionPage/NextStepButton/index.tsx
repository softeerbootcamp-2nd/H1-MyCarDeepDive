import { useNavigate, useParams } from 'react-router-dom';
import Button from '@/Components/Button';
import { useContext } from 'react';
import { QuestionContext } from '@/context/QuestionProvider';

function NextStepButton() {
  const { step } = useParams();
  const { myLifeStyle, lifeStyle } = useContext(QuestionContext);
  const navigation = useNavigate();

  const clickHandler = () => {
    step === '1'
      ? navigation('/recommend/question/2')
      : step === '2'
      ? navigation('/recommend/result/basic')
      : step === 'addition'
      ? navigation('/recommend/result/addition')
      : null;
  };

  const myLifeStyleHasEmptyValue = Object.values(myLifeStyle).some(
    value => value === '',
  );

  return (
    <div
      className={`${
        step === 'addition' ? 'pb-9' : 'absolute bottom-9'
      } left-0 w-full flex justify-center`}
    >
      <Button
        width='w-[608px]'
        height='h-[52px]'
        variant='primary'
        text={
          step === '1'
            ? '다음'
            : step === '2'
            ? '선택 완료'
            : step === 'addition'
            ? '완료'
            : ''
        }
        disabled={
          (step === '2' && !lifeStyle) ||
          (step === 'addition' && myLifeStyleHasEmptyValue)
        }
        onClick={clickHandler}
      />
    </div>
  );
}

export default NextStepButton;
