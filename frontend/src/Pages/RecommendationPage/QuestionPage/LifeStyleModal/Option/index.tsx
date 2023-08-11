import Item from './Item';

interface OptionProps {
  trim: string;
  attribute: string;
  carImage: string;
  options: {
    name: string;
    image: string;
  }[];
}

function Option({ trim, attribute, carImage, options }: OptionProps) {
  return (
    <>
      <div className='mt-3 relative overflow-hidden'>
        <div className='h-20 bg-grey-100'>
          <div className='h-full flex flex-col justify-center ml-5'>
            <div className='font-body4-medium text-grey-1000'>{trim}</div>
            <div className='font-caption1-regular text-grey-500'>
              {attribute}
            </div>
          </div>
        </div>
        <div className='h-20 bg-grey-500'></div>
        <img
          src={carImage}
          alt='Prestige'
          className='h-[150px] object-cover absolute bottom-0 left-[350px]'
        />
      </div>
      <div className='flex font-body4-regular text-grey-200'>
        {options.map(item => (
          <Item image={item.image} name={item.name} key={item.name} />
        ))}
      </div>
    </>
  );
}

export default Option;
