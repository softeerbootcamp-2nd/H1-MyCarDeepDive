import { WrapperProps } from '@/global/type';

function MyCarInfoWrapper({ children }: WrapperProps) {
  return <div className='w-[608px] mt-9 mx-auto'>{children}</div>;
}

export default MyCarInfoWrapper;
