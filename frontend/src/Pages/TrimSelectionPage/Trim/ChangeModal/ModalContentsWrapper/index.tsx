import { WrapperProps } from '@/global/type';

function ModalContentsWrapper({ children }: WrapperProps) {
  return (
    <div className='w-[582px] min-h-[455px] absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-grey-1000 rounded-xl'>
      {children}
    </div>
  );
}

export default ModalContentsWrapper;
