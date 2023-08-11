interface RecommendCarInfoProps {
  carData: {
    name: string;
    trim: string;
    price: string;
    feature: string;
  };
}

function CarInfo({ carData }: RecommendCarInfoProps) {
  return (
    <>
      <div className='flex justify-between'>
        <div>
          <span className='font-h2-medium text-grey-50 mr-2'>
            {carData.name}
          </span>
          <span className='font-body2-medium text-grey-300'>
            <span className='leading-[22px]'>{carData.trim}</span>
          </span>
        </div>
        <span className='font-h4-medium text-grey-100'>{carData.price}원</span>
      </div>
      <p className='font-body4-regular text-grey-400 mt-[5px]'>
        {carData.feature}
      </p>
    </>
  );
}

export default CarInfo;
