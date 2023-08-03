import { QuestionStepProps } from '../../global/type';

function ProgressBar({ step }: QuestionStepProps) {
  return (
    <div className='w-full h-[4px] bg-grey-800 overflow-hidden'>
      <div
        className={`${
          step === 1 ? 'w-1/2' : 'w-full'
        } h-full bg-secondary progress-bar-${step}`}
      ></div>
    </div>
  );
}

export default ProgressBar;
