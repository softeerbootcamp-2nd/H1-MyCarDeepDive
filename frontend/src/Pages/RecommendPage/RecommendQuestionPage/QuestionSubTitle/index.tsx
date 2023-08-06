import { QuestionStepProps } from '@/global/type';

function QuestionSubTitle({ step }: QuestionStepProps) {
  if (step !== 'addition') return;
  return (
    <p className='font-body4-regular text-grey-300'>
      당신의 라이프스타일을 반영한 차를 추천해 드릴게요.
    </p>
  );
}

export default QuestionSubTitle;
