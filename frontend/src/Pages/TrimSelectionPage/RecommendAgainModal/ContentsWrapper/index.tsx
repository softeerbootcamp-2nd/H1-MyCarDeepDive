import { WrapperProps } from '@/global/type';

function ContentsWrapper({ children }: WrapperProps) {
  return <div className='mx-8 mt-6'>{children}</div>;
}

export default ContentsWrapper;
