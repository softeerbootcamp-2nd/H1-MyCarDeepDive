import Button from '@/Components/Common/Button/Button';

type NextStepButtonProps = {
  step: number;
  setStep: React.Dispatch<React.SetStateAction<number>>;
  lifeStyle: string;
};

function NextStepButton({ step, setStep, lifeStyle }: NextStepButtonProps) {
  return (
    <div className='absolute bottom-[36px] left-0 w-full flex justify-center'>
      <Button
        width='w-[608px]'
        height='h-[52px]'
        variant='primary'
        text={step === 1 ? '다음' : '선택 완료'}
        disabled={step === 2 && !lifeStyle}
        onClick={() => setStep(step + 1)}
      />
    </div>
  );
}

export default NextStepButton;
