interface TrimCarImageProps {
  carImage: string;
  trimName: string;
}

function TrimCarImage({ carImage, trimName }: TrimCarImageProps) {
  return <img src={carImage} alt={trimName} />;
}

export default TrimCarImage;
