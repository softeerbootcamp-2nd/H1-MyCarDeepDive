interface UnlockItemProps {
  image: string;
  name: string;
}

function UnlockItem({ image, name }: UnlockItemProps) {
  return (
    <div className='w-full flex gap-3'>
      <img src={image} alt={name} />
      <span className='font-body3-regular text-grey-100'>{name}</span>
    </div>
  );
}

export default UnlockItem;
