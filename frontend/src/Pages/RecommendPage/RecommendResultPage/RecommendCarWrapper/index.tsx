import { WrapperProps } from '@/global/type';

function RecommendCarWrapper({ children }: WrapperProps) {
  return <div className='mt-3 relative overflow-hidden'>{children}</div>;
}

export default RecommendCarWrapper;
