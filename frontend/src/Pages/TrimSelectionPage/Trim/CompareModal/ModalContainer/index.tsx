import { WrapperProps } from '@/global/type';

function ModalContainer({ children }: WrapperProps) {
  return (
    <div className='w-[900px] h-[1350px] mx-auto mt-[148px] mb-[68px] bg-grey-1000 rounded-xl'>
      {children}
    </div>
  );
}

export default ModalContainer;
