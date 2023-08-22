import { useContext } from 'react';
import Item from './Item';
import { CarContext } from '@/context/CarProvider';

function Navigation() {
  const { carSpec, color, optionData } = useContext(CarContext);

  return (
    <div className='mt-[25px]'>
      <div className='inline-flex gap-[22px] items-center justify-center'>
        <Item
          name={'트림'}
          index={1}
          address={'trim'}
          value={carSpec.trim.name}
        />
        <Item
          name={'색상'}
          index={2}
          address={'color'}
          value={`${color.exteriorColor.name} / ${color.interiorColor.name}`}
        />
        <Item
          name={'옵션'}
          index={3}
          address={'option'}
          value={optionData.map(item => item.name).join(', ')}
        />
      </div>
    </div>
  );
}

export default Navigation;
