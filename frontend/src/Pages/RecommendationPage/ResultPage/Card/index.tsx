import logoSkyBlue from '@/assets/icon/logo-skyblue.svg';
import Title from './Title';
import Description from './Description';
import CarImage from './CarImage';
import Bubble from './Bubble';

interface CardProps {
  cardData: {
    title: string;
    description: {
      accent: string;
      general: string;
    };
    image: string;
    bubble: string;
  };
}

function Card({ cardData }: CardProps) {
  return (
    <div className='relative w-[300px] h-[419px] rounded-xl border-2 border-grey-1000 border-opacity-50 bg-grey-1000 bg-opacity-30 overflow-hidden'>
      <img
        src={logoSkyBlue}
        alt='Hyundai-logo'
        className='absolute top-[17px] left-[19px]'
      />
      <Title title={cardData.title} />
      <Description description={cardData.description} />
      <CarImage image={cardData.image} />
      <Bubble bubble={cardData.bubble} />
    </div>
  );
}

export default Card;
