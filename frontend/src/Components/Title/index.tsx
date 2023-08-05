interface TitleProps {
  title: string;
}

function Title({ title }: TitleProps) {
  return (
    <div className='font-h2-medium'>
      <span className='text-[24px] leading-[30px] text-grey-0'>{title}</span>
    </div>
  );
}

export default Title;
