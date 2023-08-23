interface Props {
  image: string;
}

function CarImage({ image }: Props) {
  return (
    <img
      src={'https://' + image}
      alt='Palisade'
      className='absolute top-[91px] left-[-30px] h-[246px] object-cover max-w-none'
    />
  );
}

export default CarImage;
