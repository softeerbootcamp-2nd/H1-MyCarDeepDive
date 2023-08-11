import { WrapperProps } from '@/global/type';

function TrimWrapper({ children }: WrapperProps) {
  return <div className='mx-[38px] flex justify-between gap-7'>{children}</div>;
}

export default TrimWrapper;
