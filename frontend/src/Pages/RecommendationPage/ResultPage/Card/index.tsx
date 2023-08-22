import { recommendType } from '@/api/Recommendation/getRecommendation';
import logoSkyBlue from '@/assets/icon/logo-skyblue.svg';
import Title from './Title';
import Description from './Description';
import CarImage from './CarImage';
import Bubble from './Bubble';

function Card({ trim_name, car_img_url, comment1, comment2 }: recommendType) {
  return (
    <div className='relative w-[300px] h-[419px] rounded-xl border-2 border-grey-1000 border-opacity-50 bg-grey-1000 bg-opacity-30 overflow-hidden'>
      <img
        src={logoSkyBlue}
        alt='Hyundai-logo'
        className='absolute top-[17px] left-[19px]'
      />
      <Title trim_name={trim_name} />
      <Description description={comment1} />
      <CarImage image={car_img_url} />
      <Bubble bubble={comment2} />
    </div>
  );
}

export default Card;
