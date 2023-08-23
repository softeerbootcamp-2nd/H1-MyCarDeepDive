import { priceToString } from '@/utils';
import UnderLine from '@/Components/UnderLine';

interface Props {
  exterior_color_name: string;
  exterior_color_img_url: string;
  exterior_color_price: number;
  interior_color_name: string;
  interior_color_img_url: string;
  interior_color_price: number;
}

function ColorInfo({
  exterior_color_name,
  exterior_color_img_url,
  exterior_color_price,
  interior_color_name,
  interior_color_img_url,
  interior_color_price,
}: Props) {
  return (
    <>
      <div className='font-caption1-regular text-grey-300 mb-1.5'>색상</div>
      <div className='flex justify-between gap-4'>
        <div className='w-full'>
          <div className='flex gap-4'>
            <img
              src={'https://' + exterior_color_img_url}
              alt={exterior_color_name}
              className='w-[60px] h-[60px] rounded'
            />
            <div className='flex flex-col gap-1'>
              <div className='font-body4-regular text-grey-200'>
                {`외장 - ${exterior_color_name}`}
              </div>
              <div className='font-h4-medium text-grey-100'>{`${priceToString(
                exterior_color_price,
              )}원`}</div>
            </div>
          </div>
        </div>
        <div className='w-full'>
          <div className='flex gap-4'>
            <img
              src={'https://' + interior_color_img_url}
              alt={interior_color_name}
              className='w-[60px] h-[60px] rounded'
            />
            <div className='flex flex-col gap-1'>
              <div className='font-body4-regular text-grey-200'>
                {`내장 - ${interior_color_name}`}
              </div>
              <div className='font-h4-medium text-grey-100'>{`${priceToString(
                interior_color_price,
              )}원`}</div>
            </div>
          </div>
        </div>
      </div>
      <UnderLine margin={'mt-[26px] mb-6'} />
    </>
  );
}

export default ColorInfo;
