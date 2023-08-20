import { useContext } from 'react';
import Item from './Item';
import { CarContext } from '@/context/CarProvider';

function Navigation() {
  const { carSpec } = useContext(CarContext);

  return (
    <div className='flex gap-[25px] mt-[25px]'>
      <div className='inline-flex gap-3 items-center justify-center'>
        <Item
          name={'트림'}
          index={1}
          address={'trim'}
          value={carSpec.trim.name}
        />
        <Item name={'색상'} index={2} address={'color'} value={'gg'} />
        <Item name={'옵션'} index={3} address={'option'} value={'gg'} />
      </div>
    </div>
  );
}

export default Navigation;
