import { priceToString } from '@/utils';

interface Props {
  name: string;
  price: number;
}

function OptionItem({ name, price }: Props) {
  return (
    <div className='flex gap-4 justify-between'>
      <p>{name}</p>
      <p className='font-body4-medium text-grey-100 whitespace-nowrap'>
        {priceToString(price)}원
      </p>
    </div>
  );
}

export default OptionItem;
