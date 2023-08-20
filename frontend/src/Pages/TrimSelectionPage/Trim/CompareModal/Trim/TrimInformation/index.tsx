import { priceToString } from '@/utils';

interface TrimInformationProps {
  summary: string;
  trim_name: string;
  price: number;
}

function TrimInformation({ summary, trim_name, price }: TrimInformationProps) {
  return (
    <div className='mt-[25px] mb-[26px] flex flex-col gap-2'>
      <span className='font-body4-regular text-grey-300'>{summary}</span>
      <span className='font-h2-medium text-black'>{trim_name}</span>
      <span className='font-h4-medium text-grey-200'>
        <span className='leading-[24px]'>{'₩' + priceToString(price)}</span>
        <span className='font-body3-regular'>부터</span>
      </span>
    </div>
  );
}

export default TrimInformation;
