interface CardCarImageProps {
  image: string;
}

function CardCarImage({ image }: CardCarImageProps) {
  return (
    <img
      src={image}
      alt='Palisade'
      className='absolute top-[91px] left-0 h-[246px] object-cover'
    />
  );
}

export default CardCarImage;
