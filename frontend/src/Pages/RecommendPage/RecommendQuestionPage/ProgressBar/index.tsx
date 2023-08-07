import { QuestionStepProps } from '@/global/type';

function ProgressBar({ step }: QuestionStepProps) {
  if (step === 'addition') return;
  return (
    <div className='w-full h-1 bg-grey-800 overflow-hidden fixed top-[92px]'>
      <div
        className={`${
          step === '1' ? 'w-1/2' : 'w-full'
        } h-full bg-secondary progress-bar-${step}`}
      ></div>
    </div>
  );
}

export default ProgressBar;
