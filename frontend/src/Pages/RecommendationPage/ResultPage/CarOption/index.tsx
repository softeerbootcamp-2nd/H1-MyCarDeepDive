import Item from './Item';

interface RecommendCarOptionProps {
  title: string;
  optionData: {
    image: string;
    name: string;
    price: string;
    description: string;
  }[];
}

function CarOption({ title, optionData }: RecommendCarOptionProps) {
  return (
    <>
      <div className='font-caption1-regular text-grey-300 mb-1.5'>{title}</div>
      <div className='flex justify-between gap-4'>
        {optionData.map(item => (
          <Item
            key={item.name}
            image={item.image}
            name={item.name}
            price={item.price}
            description={item.description}
          />
        ))}
      </div>
    </>
  );
}

export default CarOption;
