import { ReactNode } from 'react';

interface Props {
  children: ReactNode;
}
function ColorItems({ children }: Props) {
  return <div className='flex flex-wrap gap-x-4'>{children}</div>;
}

export default ColorItems;
