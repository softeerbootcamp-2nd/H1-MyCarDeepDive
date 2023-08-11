import { WrapperProps } from '@/global/type';

function FeatureAndTrimSelectionWrapper({ children }: WrapperProps) {
  return (
    <div className='absolute top-0 w-[416px] right-0 mt-[120px] px-12 py-[51px]'>
      {children}
    </div>
  );
}

export default FeatureAndTrimSelectionWrapper;
