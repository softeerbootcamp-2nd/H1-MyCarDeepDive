function Description({ color, rate }: { color: string; rate: number }) {
  return (
    <>
      <div className='flex justify-between items-center mt-4 mb-3'>
        <p className='font-body4-medium'>{color}</p>
        <p className='font-caption1-medium text-secondary'>
          {rate}%<span className='text-grey-300'>의 구매자가 선택한</span>
        </p>
      </div>
    </>
  );
}

export default Description;
