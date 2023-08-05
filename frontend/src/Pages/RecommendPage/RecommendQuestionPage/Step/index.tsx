import { QuestionStepProps } from '@/global/type';

function Step({ step }: QuestionStepProps) {
  return (
    <div className='w-[64px] h-[36px] shrink-0 rounded-[22px] bg-grey-900  flex justify-center items-center'>
      <span className='font-h4-medium'>
        <span className='leading-[24px] tracking-[-0.2px] text-grey-400'>
          {step}/2
        </span>
      </span>
    </div>
  );
}

export default Step;
