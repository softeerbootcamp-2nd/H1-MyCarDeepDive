import LifeStyleModalOptionItem from './LifeStyleModalOptionItem';

interface optionItem {
  name: string;
  image: string;
}

interface LifeStyleModalOptionProps {
  trim: string;
  attribute: string;
  carImage: string;
  options: optionItem[];
}

function LifeStyleModalOption({
  trim,
  attribute,
  carImage,
  options,
}: LifeStyleModalOptionProps) {
  return (
    <>
      <div className='mt-3 relative overflow-hidden'>
        <div className='h-[80px] bg-grey-100'>
          <div className='h-full flex flex-col justify-center ml-5'>
            <div className='font-body4-medium text-grey-1000'>{trim}</div>
            <div className='font-caption1-regular text-grey-500'>
              {attribute}
            </div>
          </div>
        </div>
        <div className='h-[80px] bg-grey-500'></div>
        <img
          src={carImage}
          alt='Prestige'
          className='h-[150px] object-cover absolute bottom-0 left-[350px]'
        />
      </div>
      <div className='flex font-body4-regular text-grey-200'>
        {options.map(item => (
          <LifeStyleModalOptionItem
            image={item.image}
            name={item.name}
            key={item.name}
          />
        ))}
      </div>
    </>
  );
}

export default LifeStyleModalOption;
