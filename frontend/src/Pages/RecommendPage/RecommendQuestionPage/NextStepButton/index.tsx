import { useNavigate } from 'react-router-dom';
import Button from '@/Components/Button';

interface NextStepButtonProps {
  step: string;
  lifeStyle: string;
}

function NextStepButton({ step, lifeStyle }: NextStepButtonProps) {
  const navigation = useNavigate();

  const clickHandler = () => {
    step === '1'
      ? navigation('/recommend/question/2')
      : navigation('/recommend/result');
  };

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
        disabled={step === '2' && !lifeStyle}
        onClick={clickHandler}
      />
    </div>
  );
}

export default NextStepButton;
