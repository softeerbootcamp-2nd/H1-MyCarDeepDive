import UnderLine from '@/Components/UnderLine';
import UnlockItem from '../UnlockItem';
import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';

function UnlockColor() {
  const { color } = useContext(CarContext);

  return (
    <div>
      <div className='font-body3-medium text-primary'>해제 색상</div>
      <UnderLine margin='mt-2 mb-3' />
      <div className='flex'>
        <UnlockItem
          image={color.exteriorColor.imgUrl}
          name={`외장 - ${color.exteriorColor.name}`}
        />
        <UnlockItem
          image={color.interiorColor.imgUrl}
          name={`내장 - ${color.interiorColor.name}`}
        />
      </div>
    </div>
  );
}

export default UnlockColor;
