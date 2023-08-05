import { QuestionStepProps } from '@/global/type';
import Step from '../Step';

function QuestionTitle({ step }: QuestionStepProps) {
  return (
    <div
      className={`mt-[48px] mx-auto flex justify-between ${
        step === '1' && 'mb-6'
      }`}
    >
      {step === '1' ? (
        <p className='font-h2-medium'>
          <span className='text-[22px] leading-[28px]'>나이</span>
          <span className='font-h5-regular'>
            <span className='text-[22px] leading-[28px]'>를 알려주세요.</span>
          </span>
        </p>
      ) : (
        <p className='font-h5-regular'>
          <span className='text-[22px] leading-[28px]'>유사한 </span>
          <span className='font-h2-medium'>
            <span className='text-[22px] leading-[28px]'>라이프스타일을 </span>
          </span>
          <span className='text-[22px] leading-[28px]'>
            선택하면
            <br /> 차량 조합을 추천해 드려요.
          </span>
        </p>
      )}
      <Step step={step} />
    </div>
  );
}

export default QuestionTitle;
