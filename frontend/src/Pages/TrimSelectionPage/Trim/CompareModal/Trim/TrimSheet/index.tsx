interface TrimSheetProps {
  sheetImage: string;
  sheetName: string;
}

function TrimSheet({ sheetImage, sheetName }: TrimSheetProps) {
  return (
    <>
      <img
        src={sheetImage}
        alt={sheetName}
        className='mt-[51px] mb-2 mx-auto'
      />
      {sheetName.length > 16 ? (
        <div className='w-[160px] font-body3-regular text-grey-300'>
          <span className='leading-[16px]'>{sheetName}</span>
        </div>
      ) : (
        <div className='font-body3-regular text-grey-300'>
          <span className='leading-[16px]'>{sheetName}</span>
        </div>
      )}
    </>
  );
}

export default TrimSheet;
