interface OptionItemProps {
  image: string;
  name: string;
}

function Item({ image, name }: OptionItemProps) {
  return (
    <div>
      <img src={image} alt={name} className='mb-3' />
      <span>{name}</span>
    </div>
  );
}

export default Item;
