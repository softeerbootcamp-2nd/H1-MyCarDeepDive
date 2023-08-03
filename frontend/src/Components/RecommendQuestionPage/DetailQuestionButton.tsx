import { QuestionStepProps } from '../../global/type';

function DetailQuestionButton({ step }: QuestionStepProps) {
  if (step !== 2) return;
  return (
    <a
      href=''
      className='inline-block mt-4 mb-3 font-body4-medium text-secondary underline underline-offset-4	'
    >
      <span className=' leading-4 tracking-[-0.07px]'>
        원하는 라이프스타일이 없다면?
      </span>
    </a>
  );
}

export default DetailQuestionButton;
