import sheet from '@/assets/icon/Sheet.svg';

interface TrimSheetProps {
  seat_name: string;
}

function TrimSheet({ seat_name }: TrimSheetProps) {
  return (
    <>
      <img src={sheet} alt={seat_name} className='mt-[51px] mb-2 mx-auto' />
      {seat_name.length > 16 ? (
        <div className='w-[160px] font-body3-regular text-grey-300'>
          <span className='leading-[16px]'>{seat_name}</span>
        </div>
      ) : (
        <div className='font-body3-regular text-grey-300'>
          <span className='leading-[16px]'>{seat_name}</span>
        </div>
      )}
    </>
  );
}

export default TrimSheet;
