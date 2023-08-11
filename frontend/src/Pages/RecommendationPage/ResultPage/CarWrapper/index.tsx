import { WrapperProps } from '@/global/type';

function CarWrapper({ children }: WrapperProps) {
  return <div className='relative overflow-hidden'>{children}</div>;
}

export default CarWrapper;
