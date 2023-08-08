import { WrapperProps } from '@/global/type';

function TrimSelectRadioGroupWrapper({ children }: WrapperProps) {
  return (
    <div className='w-full h-[246px] py-3 px-3 rounded-lg border border-grey-700'>
      {children}
    </div>
  );
}

export default TrimSelectRadioGroupWrapper;
