import { WrapperProps } from '@/global/type';

function ContentsWrapper({ children }: WrapperProps) {
  return (
    <div className='absolute top-0 w-[416px] right-0 mt-[120px] px-12 py-[51px] z-30 bg-grey-1000'>
      {children}
    </div>
  );
}

export default ContentsWrapper;
