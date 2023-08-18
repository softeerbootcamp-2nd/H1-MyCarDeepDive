import { WrapperProps } from '@/global/type';

function LandingPageWrapper({ children }: WrapperProps) {
  return <div className='relative w-full h-screen'>{children}</div>;
}

export default LandingPageWrapper;
