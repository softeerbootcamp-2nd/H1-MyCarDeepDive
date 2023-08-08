interface TrimNavigationProps {
  navigationImage: string;
  navigationName: string;
  navigationSize: string;
  sheetName: string;
}

function TrimNavigation({
  navigationImage,
  navigationName,
  navigationSize,
  sheetName,
}: TrimNavigationProps) {
  return (
    <>
      <img
        src={navigationImage}
        alt={navigationName}
        className={`${
          sheetName.length > 16 ? 'mt-[27px]' : 'mt-[51px]'
        } mb-2 mx-auto`}
      />
      <div className='font-h1-bold text-secondary mb-1'>{navigationSize}</div>
      <div className='font-body3-regular text-grey-300'>
        <span className='leading-[16px]'>{navigationName}</span>
      </div>
    </>
  );
}

export default TrimNavigation;
