interface CardCarImageProps {
  image: string;
}

function CardCarImage({ image }: CardCarImageProps) {
  return (
    <img
      src={image}
      alt='Palisade'
      className='absolute top-[91px] left-[-30px] h-[246px] object-cover max-w-none'
    />
  );
}

export default CardCarImage;
