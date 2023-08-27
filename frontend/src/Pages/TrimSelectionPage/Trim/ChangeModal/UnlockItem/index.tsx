interface UnlockItemProps {
  image: string;
  name: string;
}

function UnlockItem({ image, name }: UnlockItemProps) {
  return (
    <div className='w-full flex gap-3'>
      <img src={`https://${image}`} alt={name} className='w-[60px] h-[60px]' />
      <span className='font-body3-regular text-grey-100'>{name}</span>
    </div>
  );
}

export default UnlockItem;
