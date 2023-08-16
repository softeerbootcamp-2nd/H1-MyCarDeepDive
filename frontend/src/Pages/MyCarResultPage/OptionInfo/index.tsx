import UnderLine from '@/Components/UnderLine';
import comport from '@/assets/image/my-car-comport.png';
import smartSense from '@/assets/image/exterior-smartsense.png';

function OptionInfo() {
  return (
    <>
      <div className='font-caption1-regular text-grey-300 mb-1.5'>옵션</div>
      <div className='flex justify-between gap-4'>
        <div className='w-full'>
          <div className='flex gap-4'>
            <img src={comport} alt={'컴포트 II'} />
            <div className='flex flex-col gap-1'>
              <div className='font-body4-regular text-grey-200'>컴포트 II</div>
              <div className='font-h4-medium text-grey-100'>1,090,000원</div>
            </div>
          </div>
        </div>
        <div className='w-full'>
          <div className='flex gap-4'>
            <img src={smartSense} alt={'현대 스마트센스 I'} />
            <div className='flex flex-col gap-1'>
              <div className='font-body4-regular text-grey-200'>
                현대 스마트센스 I
              </div>
              <div className='font-h4-medium text-grey-100'>790,000원</div>
            </div>
          </div>
        </div>
      </div>
      <UnderLine margin={'mt-10 mb-4'} />
    </>
  );
}

export default OptionInfo;
