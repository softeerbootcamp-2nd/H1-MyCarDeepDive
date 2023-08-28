import Button from '@/Components/Button';
import { CarContext } from '@/context/CarProvider';
import { priceToString } from '@/utils';
import { useContext } from 'react';
import { useNavigate } from 'react-router-dom';

function ShowQuotationButton() {
  const { color, carSpec } = useContext(CarContext);
  const navigation = useNavigate();
  return (
    <div className='ml-2'>
      <Button
        width='px-4'
        height='h-10'
        variant='primaryBody4'
        rounded='4px'
        text={`${priceToString(
          color.exteriorColor.price + color.interiorColor.price + carSpec.price,
        )} 원 견적내기`}
        onClick={() => navigation('/mycar/ready')}
      />
    </div>
  );
}

export default ShowQuotationButton;
