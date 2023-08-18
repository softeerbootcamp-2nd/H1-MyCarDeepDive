interface CardTagProps {
  tag: string;
}

function CardTag({ tag }: CardTagProps) {
  return (
    <div className='bg-grey-200 py-1.5 px-2.5 font-caption1-regular text-grey-800 rounded-full'>
      {tag}
    </div>
  );
}

export default CardTag;
