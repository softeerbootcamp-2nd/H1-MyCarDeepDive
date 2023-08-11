import { WrapperProps } from '@/global/type';

function TrimWrapper({ children }: WrapperProps) {
  return <div className='w-[185px] text-center'>{children}</div>;
}

export default TrimWrapper;
