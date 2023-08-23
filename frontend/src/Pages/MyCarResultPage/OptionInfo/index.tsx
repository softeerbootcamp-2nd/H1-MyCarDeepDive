import UnderLine from '@/Components/UnderLine';
import OptionItem from './OptionItem';

interface Props {
  option_list: {
    option_name: string;
    option_price: number;
    option_img_url: string;
  }[];
}

function OptionInfo({ option_list }: Props) {
  return (
    <>
      <div className='font-caption1-regular text-grey-300 mb-1.5'>옵션</div>
      <div className='grid grid-cols-2 gap-4'>
        {option_list.map(option => (
          <OptionItem {...option} key={option.option_name} />
        ))}
      </div>
      <UnderLine margin={'mt-10 mb-4'} />
    </>
  );
}

export default OptionInfo;
