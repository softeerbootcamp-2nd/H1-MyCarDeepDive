interface OptionItemProps {
  image: string;
  name: string;
}

function OptionItem({ image, name }: OptionItemProps) {
  return (
    <div>
      <img src={image} alt={name} className='mb-3' />
      <span>{name}</span>
    </div>
  );
}

export default OptionItem;
