interface IconProps {
  imgUrl: string;
  type: 'unavailable' | 'available';
}

function Icon({ imgUrl, type }: IconProps) {
  return (
    <>
      <div className='bg-primary absolute opacity-40 rounded top-0 left-0 w-full h-full z-10'></div>
      <img
        src={imgUrl}
        alt='mark'
        className={`absolute z-20 ${
          type === 'unavailable' && 'w-6 top-[-10px] right-[-10px]'
        }`}
      />
    </>
  );
}

export default Icon;
