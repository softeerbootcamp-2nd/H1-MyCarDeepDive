interface LifeStyleModalOptionItemProps {
  image: string;
  name: string;
}

function LifeStyleModalOptionItem({
  image,
  name,
}: LifeStyleModalOptionItemProps) {
  return (
    <div>
      <img src={image} alt={name} className='mb-3' />
      <span>{name}</span>
    </div>
  );
}

export default LifeStyleModalOptionItem;
