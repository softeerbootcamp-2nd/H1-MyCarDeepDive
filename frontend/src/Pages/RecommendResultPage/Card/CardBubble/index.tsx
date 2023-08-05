import whitePoint from '@/assets/icon/white-point.svg';

interface CardBubbleProps {
  bubble: string;
}

function CardBubble({ bubble }: CardBubbleProps) {
  return (
    <div className='absolute bottom-5 left-0 w-full font-body4-regular'>
      <img src={whitePoint} alt='whitePoint' className='ml-8' />
      <div className='bg-grey-1000 w-[257px] px-3 py-2 text-grey-400 mx-auto rounded-lg leading-5 tracking-negative-05'>
        {bubble}
      </div>
    </div>
  );
}

export default CardBubble;
