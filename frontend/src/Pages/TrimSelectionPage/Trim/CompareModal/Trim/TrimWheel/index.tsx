import basicWheel from '@/assets/icon/Basic-wheel.svg';
import alloyWheel from '@/assets/icon/Alloy-wheel.svg';

interface TrimWheelProps {
  wheel_name: string;
  wheel_size: number;
}

function TrimWheel({ wheel_name, wheel_size }: TrimWheelProps) {
  return (
    <>
      <img
        src={wheel_name === '기본 휠' ? basicWheel : alloyWheel}
        alt={wheel_name}
        className='mx-auto mb-[14px]'
      />
      <div className='font-h1-bold text-secondary mb-1'>
        {wheel_size + ' inch '}
      </div>
      <div className='font-body3-regular text-grey-300'>
        <span className='leading-[16px]'>{wheel_name}</span>
      </div>
    </>
  );
}

export default TrimWheel;
