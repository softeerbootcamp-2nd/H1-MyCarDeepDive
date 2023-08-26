import UnderLine from '@/Components/UnderLine';
import UnlockItem from '../UnlockItem';
import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';

function UnlockColor() {
  const { color } = useContext(CarContext);
  const unlockList = [
    {
      image: color.interiorColor.imgUrl,
      name: `외장 - ${color.interiorColor.name}`,
    },
    {
      image: color.exteriorColor.imgUrl,
      name: `내장 - ${color.exteriorColor.name}`,
    },
  ];

  return (
    <div>
      <div className='font-body3-medium text-primary'>해제 색상</div>
      <UnderLine margin='mt-2 mb-3' />
      <div className='flex'>
        {unlockList.map(item => (
          <UnlockItem image={item.image} name={item.name} key={item.name} />
        ))}
      </div>
    </div>
  );
}

export default UnlockColor;
