interface CardDescriptionProps {
  description: string;
}

function Description({ description }: CardDescriptionProps) {
  return (
    <div className='w-[217px] mx-auto mt-2 font-body2-regular text-center'>
      <span className='text-primary text-xl leading-7 tracking-negative-03'>
        {description.slice(0, 2)}
      </span>
      <span className='text-grey-0 text-xl leading-7 tracking-negative-03'>
        {description.slice(2)}
      </span>
    </div>
  );
}

export default Description;
