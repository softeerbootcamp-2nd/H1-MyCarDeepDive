import { priceToString } from '@/utils';

interface OptionItemProps {
  image: string;
  name: string;
  price: number;
  description: string;
}

function Item({ image, name, price, description }: OptionItemProps) {
  return (
    <div className='w-full'>
      <div className='flex gap-4'>
        <img
          src={'https://' + image}
          alt={name}
          className='w-[60px] h-[60px] rounded'
        />
        <div className='flex flex-col gap-1'>
          <div className='font-body4-regular text-grey-200'>{name}</div>
          <div className='font-h4-medium text-grey-100'>
            {priceToString(price)}원
          </div>
        </div>
      </div>
      <div className='w-full mt-3 p-3 bg-secondary bg-opacity-10 font-body4-regular text-secondary rounded-r-lg rounded-bl-lg'>
        {description}
      </div>
    </div>
  );
}

export default Item;
