import { WrapperProps } from '@/global/type';

function ContentWrapper({ children }: WrapperProps) {
  return <div className='w-[607px] mx-auto'>{children}</div>;
}

export default ContentWrapper;
