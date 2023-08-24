interface TagProps {
  description: string;
  index?: number;
}

function Tag({ description, index }: TagProps) {
  return (
    <p className='font-caption1-medium bg-grey-300 text-grey-1000 w-10 h-5 flex justify-center items-center rounded-tl rounded-br absolute top-0 left-0'>
      {description} {index !== undefined ? index + 1 : null}
    </p>
  );
}

export default Tag;
