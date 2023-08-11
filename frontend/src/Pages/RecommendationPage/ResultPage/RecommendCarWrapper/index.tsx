import { WrapperProps } from '@/global/type';

function RecommendCarWrapper({ children }: WrapperProps) {
  return <div className='relative overflow-hidden'>{children}</div>;
}

export default RecommendCarWrapper;
