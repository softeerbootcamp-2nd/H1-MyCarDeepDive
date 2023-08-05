interface CardDescriptionProps {
  description: {
    accent: string;
    general: string;
  };
}

function CardDescription({ description }: CardDescriptionProps) {
  return (
    <div className='w-[217px] mx-auto mt-2 font-body2-regular text-center'>
      <span className='text-primary text-xl leading-7 tracking-negative-03'>
        {description.accent}
      </span>
      <span className='text-grey-0 text-xl leading-7 tracking-negative-03'>
        {description.general}
      </span>
    </div>
  );
}

export default CardDescription;
