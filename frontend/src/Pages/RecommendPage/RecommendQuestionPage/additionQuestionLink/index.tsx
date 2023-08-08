import { Link } from 'react-router-dom';
import { QuestionStepProps } from '@/global/type';

function DetailQuestionButton({ step }: QuestionStepProps) {
  if (step !== '2') return;
  return (
    <Link
      to='/recommend/question/addition'
      className='inline-block mt-4 mb-[52px] font-body4-medium text-secondary underline underline-offset-4'
    >
      <span className=' leading-4 tracking-[-0.07px]'>
        원하는 라이프스타일이 없다면?
      </span>
    </Link>
  );
}

export default DetailQuestionButton;
