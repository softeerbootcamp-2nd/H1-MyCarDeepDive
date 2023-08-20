function Description({
  color,
  chooseRate,
}: {
  color?: string;
  chooseRate?: number;
}) {
  return (
    <>
      <div className='flex justify-between items-center mt-4 mb-3'>
        {color && <p className='font-body4-medium'>{color}</p>}
        {color && chooseRate && (
          <p className='font-caption1-medium text-secondary'>
            {chooseRate}%
            <span className='text-grey-300'>의 구매자가 선택한</span>
          </p>
        )}
      </div>
    </>
  );
}

export default Description;
