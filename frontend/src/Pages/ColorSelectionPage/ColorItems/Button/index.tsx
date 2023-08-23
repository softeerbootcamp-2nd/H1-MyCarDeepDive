import { ColorType } from '@/global/type';
import { ReactNode } from 'react';

interface ButtonProps {
  colorName: string;
  data: ColorType;
  clickHandler: (e: React.MouseEvent<HTMLButtonElement>) => void;
  children: ReactNode;
}

function Button({ colorName, data, clickHandler, children }: ButtonProps) {
  return (
    <button
      className='relative mb-2 flex justify-center items-center cursor-pointer'
      value={colorName}
      onClick={clickHandler}
      data-object={JSON.stringify(data)}
    >
      {children}
    </button>
  );
}

export default Button;
