import { QuestionStepProps } from '../../global/type';
import Step from './Step';

function QuestionTitle({ step }: QuestionStepProps) {
  return (
    <div className='mt-[48px] mb-[24px] mx-auto flex items-center justify-between'>
      <p className='font-h2-medium'>
        <span className='text-[22px] leading-[28px]'>나이</span>
        <span className='font-h5-regular'>
          <span className='text-[22px] leading-[28px]'>를 알려주세요.</span>
        </span>
      </p>
      <Step step={step} />
    </div>
  );
}

export default QuestionTitle;
