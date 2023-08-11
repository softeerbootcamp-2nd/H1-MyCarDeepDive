import { WrapperProps } from '@/global/type';

function RecommendQuestionPageWrapper({ children }: WrapperProps) {
  return <div className='pt-[92px] h-screen relative'>{children}</div>;
}

export default RecommendQuestionPageWrapper;
