import { ReactNode } from 'react';

interface WrapperProps {
  children: ReactNode;
}

function RecommendQuestionWrapper({ children }: WrapperProps) {
  return <div className='mt-[52px] max-w-[608px] mx-auto'>{children}</div>;
}

export default RecommendQuestionWrapper;
