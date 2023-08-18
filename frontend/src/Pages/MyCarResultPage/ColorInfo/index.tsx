import UnderLine from '@/Components/UnderLine';
import exteriorCrimi from '@/assets/image/exterior-crimi.png';
import interiorBlack from '@/assets/image/interior-artificial-leather-black.png';

function ColorInfo() {
  return (
    <>
      <div className='font-caption1-regular text-grey-300 mb-1.5'>색상</div>
      <div className='flex justify-between gap-4'>
        <div className='w-full'>
          <div className='flex gap-4'>
            <img src={exteriorCrimi} alt={'외장 - 크리미 화이트 펄'} />
            <div className='flex flex-col gap-1'>
              <div className='font-body4-regular text-grey-200'>
                외장 - 크리미 화이트 펄
              </div>
              <div className='font-h4-medium text-grey-100'>0원</div>
            </div>
          </div>
        </div>
        <div className='w-full'>
          <div className='flex gap-4'>
            <img src={interiorBlack} alt={'내장 - 인조가죽 (블랙)'} />
            <div className='flex flex-col gap-1'>
              <div className='font-body4-regular text-grey-200'>
                내장 - 인조가죽 (블랙)
              </div>
              <div className='font-h4-medium text-grey-100'>0원</div>
            </div>
          </div>
        </div>
      </div>
      <UnderLine margin={'mt-[26px] mb-6'} />
    </>
  );
}

export default ColorInfo;
