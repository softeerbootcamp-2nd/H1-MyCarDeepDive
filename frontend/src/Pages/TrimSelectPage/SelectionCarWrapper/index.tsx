import { WrapperProps } from '@/global/type';

function SelectionCarWrapper({ children }: WrapperProps) {
  return (
    <div
      className={`fixed top-[120px] z-40 carSelectBackground flex justify-center items-center `}
    >
      {children}
    </div>
  );
}

export default SelectionCarWrapper;
