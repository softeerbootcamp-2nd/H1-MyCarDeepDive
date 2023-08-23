import { priceToString } from '@/utils';
import UnderLine from '@/Components/UnderLine';

interface Props {
  car_name: string;
  trim_name: string;
  basic_price: number;
  engine_name: string;
  body_name: string;
  driving_system_name: string;
}

function SummaryInfo({
  car_name,
  trim_name,
  basic_price,
  engine_name,
  body_name,
  driving_system_name,
}: Props) {
  return (
    <>
      <div className='flex justify-between'>
        <div>
          <span className='font-h2-medium text-grey-50 mr-2'>{car_name}</span>
          <span className='font-body2-medium text-grey-300'>
            <span className='leading-[22px]'>{trim_name}</span>
          </span>
        </div>
        <span className='font-h4-medium text-grey-100'>{`${priceToString(
          basic_price,
        )}원`}</span>
      </div>
      <p className='font-body4-regular text-grey-400 mt-[5px]'>
        {`${engine_name} ・ ${body_name} ・ ${driving_system_name}`}
      </p>
      <UnderLine margin='mt-4 mb-[26px]' />
    </>
  );
}

export default SummaryInfo;
