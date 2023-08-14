import UnderLine from '@/Components/UnderLine';

function TrimInfo({
  title,
  trimName,
  trimPrice,
}: {
  title: string;
  trimName: string;
  trimPrice: number;
}) {
  return (
    <>
      <p className='font-body3-medium'>
        <span className='leading-[22px] text-secondary'>{title}</span>
      </p>
      <UnderLine margin='mt-[7px] mb-4' />
      <div className='flex justify-between'>
        <p className='font-body3-regular text-grey-100'>{trimName}</p>
        <p className='font-body3-medium text-grey-100 mb-4'>
          {trimPrice.toLocaleString('en-US')}원
        </p>
      </div>
    </>
  );
}

export default TrimInfo;
