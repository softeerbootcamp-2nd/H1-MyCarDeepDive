import UnderLine from '@/Components/UnderLine';
import UnlockItem from '../UnlockItem';
import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';

function UnlockOption() {
  const { optionData } = useContext(CarContext);
  return (
    <div className='mt-[26px] mb-12'>
      <div className='font-body3-medium text-primary'>해제 옵션</div>
      <UnderLine margin='mt-2 mb-3' />
      <div className='flex flex-wrap gap-3'>
        {optionData.map(item => (
          <UnlockItem image={item.imgUrl} name={item.name} key={item.name} />
        ))}
      </div>
    </div>
  );
}

export default UnlockOption;
