import { WrapperProps } from '@/global/type';

function CardWrapper({ children }: WrapperProps) {
  return (
    <div className='w-full h-[485px] relative flex items-center justify-center'>
      {children}
    </div>
  );
}

export default CardWrapper;
