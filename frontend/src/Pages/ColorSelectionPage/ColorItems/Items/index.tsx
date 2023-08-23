import { ReactNode } from 'react';

interface ItemsProps {
  children: ReactNode;
  colorType: 'interior' | 'exterior' | 'other';
  colorName: string;
}

function Items({ children, colorType, colorName }: ItemsProps) {
  return (
    <div
      className={`flex flex-col w-[68px] ${
        colorType === 'other' ? 'mb-3' : 'mb-6'
      }`}
    >
      {children}
      <p className='font-caption1-regular text-grey-100'>{colorName}</p>
    </div>
  );
}

export default Items;
