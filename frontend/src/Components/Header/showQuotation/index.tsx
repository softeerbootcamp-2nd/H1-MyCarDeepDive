import Button from '@/Components/Button';
import { CarContext } from '@/context/CarProvider';
import { useContext } from 'react';

function ShowQuotationButton() {
  const { color, carSpec } = useContext(CarContext);
  return (
    <div className='ml-2'>
      <Button
        width='px-4'
        height='h-10'
        variant='primaryBody4'
        rounded='4px'
        text={`${(
          color.exteriorColor.price +
          color.interiorColor.price +
          carSpec.price
        ).toLocaleString('en-US')} 원 견적내기`}
        onClick={() => console.log('primary')}
      />
    </div>
  );
}

export default ShowQuotationButton;
