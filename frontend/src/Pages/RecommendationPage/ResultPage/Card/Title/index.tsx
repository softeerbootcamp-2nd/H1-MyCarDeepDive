interface CardTitleProps {
  title: string;
}

function Title({ title }: CardTitleProps) {
  return (
    <div className='mt-[29px] mx-auto text-center'>
      <span className='inline-block bg-primary rounded-full px-3 py-1.5 font-caption1-medium'>
        <span className='leading-4 text-grey-1000'>{title}</span>
      </span>
    </div>
  );
}

export default Title;
