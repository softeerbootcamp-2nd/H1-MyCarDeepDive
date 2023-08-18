import { detailSelectionList } from '@/global/data';
import Item from './Item';

function Navigation() {
  return (
    <div className='flex gap-[25px] mt-[25px]'>
      {detailSelectionList.map((data, index) => {
        const { name, value, address } = data;
        return (
          <div
            key={index}
            className='inline-flex gap-3 items-center justify-center'
          >
            <Item name={name} index={index} value={value} address={address} />
          </div>
        );
      })}
    </div>
  );
}

export default Navigation;
