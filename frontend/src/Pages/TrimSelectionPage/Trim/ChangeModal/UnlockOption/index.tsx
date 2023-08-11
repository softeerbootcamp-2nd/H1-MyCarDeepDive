import { TrimChangeUnlockProps } from '@/global/type';
import UnderLine from '@/Components/UnderLine';
import UnlockItem from '../UnlockItem';

function UnlockOption({ unlockList }: TrimChangeUnlockProps) {
  return (
    <div className='mt-[26px] mb-12'>
      <div className='font-body3-medium text-primary'>해제 옵션</div>
      <UnderLine margin='mt-2 mb-3' />
      <div className='flex'>
        {unlockList.map(item => (
          <UnlockItem image={item.image} name={item.name} key={item.name} />
        ))}
      </div>
    </div>
  );
}

export default UnlockOption;
