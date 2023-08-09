interface TrimWheelProps {
  wheelImage: string;
  wheelName: string;
  wheelSize: string;
}

function TrimWheel({ wheelImage, wheelName, wheelSize }: TrimWheelProps) {
  return (
    <>
      <img src={wheelImage} alt={wheelName} className='mx-auto mb-[14px]' />
      <div className='font-h1-bold text-secondary mb-1'>{wheelSize}</div>
      <div className='font-body3-regular text-grey-300'>
        <span className='leading-[16px]'>{wheelName}</span>
      </div>
    </>
  );
}

export default TrimWheel;
