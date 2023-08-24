interface Props {
  interiorCarImage: string | undefined;
}

function InteriorImg({ interiorCarImage }: Props) {
  return (
    <img
      src={`https://${interiorCarImage}`}
      alt='interior-car-image'
      className='w-full h-full object-cover'
    />
  );
}

export default InteriorImg;
