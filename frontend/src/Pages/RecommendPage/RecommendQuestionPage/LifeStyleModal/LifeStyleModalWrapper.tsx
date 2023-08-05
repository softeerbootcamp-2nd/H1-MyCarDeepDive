import { WrapperProps } from '@/global/type';

function LifeStyleModalWrapper({ children }: WrapperProps) {
  return (
    <div className='my-[90px] pb-14 mx-auto shadow w-[688px] rounded-2xl bg-white'>
      {children}
    </div>
  );
}

export default LifeStyleModalWrapper;
