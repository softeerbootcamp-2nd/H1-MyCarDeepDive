interface TagProps {
  tagItem: string;
}

function Tag({ tagItem }: TagProps) {
  return (
    <span className='px-2.5 py-1.5 border border-grey-600 rounded-full font-caption1-medium text-grey-300'>
      <span className='leading-4 tracking-negative-05'>{tagItem}</span>
    </span>
  );
}

export default Tag;
