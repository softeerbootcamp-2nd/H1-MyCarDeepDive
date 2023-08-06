import { useNavigate } from 'react-router-dom';
import Button from '@/Components/Button';

interface NextStepButtonProps {
  step: string;
  lifeStyle: string;
  myLifeStyle: {
    drivingExperience: string;
    numberOfFamilyMembers: string;
    purpose: string;
    value: string;
    budget: string;
  };
}

function NextStepButton({ step, lifeStyle, myLifeStyle }: NextStepButtonProps) {
  const navigation = useNavigate();

  const clickHandler = () => {
    step === '1'
      ? navigation('/recommend/question/2')
      : navigation('/recommend/result');
  };

  const myLifeStyleHasEmptyValue = Object.values(myLifeStyle).some(
    value => value === '',
  );

  return (
    <div
      className={`${
        step === 'addition' ? 'pb-[36px]' : 'absolute bottom-[36px]'
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
