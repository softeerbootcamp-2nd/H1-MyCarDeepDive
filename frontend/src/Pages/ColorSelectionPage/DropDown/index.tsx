import { ReactNode } from 'react';

interface Props {
  children: ReactNode;
}

function DropDown({ children }: Props) {
  return (
    <div className='border border-primary rounded pl-4 pr-3 mb-8'>
      {children}
    </div>
  );
}

export default DropDown;
