import logoSkyBlue from '@/assets/icon/logo-skyblue.svg';
import CardTitle from './CardTitle';
import CardDescription from './CardDescription';
import CardCarImage from './CardCarImage';
import CardBubble from './CardBubble';

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
    <div className='relative w-[300px] h-[419px] rounded-xl border-2 border-grey-1000 border-opacity-50 bg-grey-1000 bg-opacity-30'>
      <img
        src={logoSkyBlue}
        alt='Hyundai-logo'
        className='absolute top-[17px] left-[19px]'
      />
      <CardTitle title={cardData.title} />
      <CardDescription description={cardData.description} />
      <CardCarImage image={cardData.image} />
      <CardBubble bubble={cardData.bubble} />
    </div>
  );
}

export default Card;
