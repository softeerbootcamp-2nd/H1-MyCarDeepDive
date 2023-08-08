interface HeaderTagProps {
  tag: string;
}

function HeaderTag({ tag }: HeaderTagProps) {
  return (
    <div className='w-[69px] h-[30px] bg-[#0f1114] bg-opacity-80 font-caption1-medium text-grey-1000 flex items-center justify-center rounded-full'>
      {tag}
    </div>
  );
}

export default HeaderTag;
