import { WrapperProps } from '@/global/type';

function TrimSelectionHeader({ children }: WrapperProps) {
  return <div className='flex justify-between mb-[2px]'>{children}</div>;
}

export default TrimSelectionHeader;
