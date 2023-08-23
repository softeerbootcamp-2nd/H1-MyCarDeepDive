import { recommendType } from '@/api/Recommendation/getRecommendation';
import { priceToString } from '@/utils';

function CarInfo({
  trim_name,
  total_price,
  engine_name,
  driving_system_name,
  body_name,
}: recommendType) {
  return (
    <>
      <div className='flex justify-between'>
        <div>
          <span className='font-h2-medium text-grey-50 mr-2'>펠리세이드</span>
          <span className='font-body2-medium text-grey-300'>
            <span className='leading-[22px]'>{trim_name}</span>
          </span>
        </div>
        <span className='font-h4-medium text-grey-100'>
          {`${priceToString(total_price)}원`}
        </span>
      </div>
      <p className='font-body4-regular text-grey-400 mt-[5px]'>
        {`${engine_name}  ・ ${driving_system_name} ・ ${body_name}`}
      </p>
    </>
  );
}

export default CarInfo;
