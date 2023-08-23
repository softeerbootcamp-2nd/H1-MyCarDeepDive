interface IconProps {
  imgUrl: string;
}

function Icon({ imgUrl }: IconProps) {
  return (
    <>
      <div className='bg-primary absolute opacity-40 rounded top-0 left-0 w-full h-full z-10'></div>
      <img src={imgUrl} alt='' className='absolute z-20' />
    </>
  );
}

export default Icon;
