import UnderLine from '@/Components/UnderLine';

function SummaryInfo() {
  return (
    <>
      <div className='flex justify-between'>
        <div>
          <span className='font-h2-medium text-grey-50 mr-2'>펠리세이드</span>
          <span className='font-body2-medium text-grey-300'>
            <span className='leading-[22px]'>Prestige</span>
          </span>
        </div>
        <span className='font-h4-medium text-grey-100'>43,460,000원</span>
      </div>
      <p className='font-body4-regular text-grey-400 mt-[5px]'>
        가솔린 ・ 2WD ・ 8인승
      </p>
      <UnderLine margin='mt-4 mb-[26px]' />
    </>
  );
}

export default SummaryInfo;
