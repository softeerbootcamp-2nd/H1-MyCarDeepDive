import { TrimChangeUnlockProps } from '@/global/type';
import UnderLine from '@/Components/UnderLine';
import UnlockItem from '../UnlockItem';

function UnlockColor({ unlockList }: TrimChangeUnlockProps) {
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
