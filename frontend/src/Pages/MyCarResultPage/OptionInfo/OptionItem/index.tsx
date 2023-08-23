import { priceToString } from '@/utils';

interface Props {
  option_name: string;
  option_price: number;
  option_img_url: string;
}

function OptionItem({ option_name, option_price, option_img_url }: Props) {
  return (
    <div className='w-full'>
      <div className='flex gap-4'>
        <img
          src={'https://' + option_img_url}
          alt={option_name}
          className='w-[60px] h-[60px] rounded'
        />
        <div className='flex flex-col gap-1'>
          <div className='font-body4-regular text-grey-200'>{option_name}</div>
          <div className='font-h4-medium text-grey-100'>{`${priceToString(
            option_price,
          )}원`}</div>
        </div>
      </div>
    </div>
  );
}

export default OptionItem;
