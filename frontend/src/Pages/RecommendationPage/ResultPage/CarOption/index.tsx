import Item from './Item';

interface RecommendCarOptionProps {
  title: string;
  exterior_color: {
    color_id: number;
    color_name: string;
    color_price: number;
    color_comment: string;
    color_icon_url: string;
  };
  interior_color: {
    color_id: number;
    color_name: string;
    color_price: number;
    color_comment: string;
    color_icon_url: string;
  };
  options: {
    option_id: number;
    option_name: string;
    option_img_url: string;
    price: number;
    comment: string;
  }[];
  packages: {
    option_id: number;
    option_name: string;
    option_img_url: string;
    price: number;
    comment: string;
  }[];
}

function CarOption({
  title,
  exterior_color,
  interior_color,
  options,
  packages,
}: RecommendCarOptionProps) {
  return (
    <>
      <div className='font-caption1-regular text-grey-300 mb-1.5'>{title}</div>
      {title === '색상' && (
        <div className='flex justify-between gap-4'>
          {[exterior_color, interior_color].map(item => (
            <Item
              key={item.color_id}
              image={item.color_icon_url}
              name={item.color_name}
              price={item.color_price}
              description={item.color_comment}
            />
          ))}
        </div>
      )}
      {title === '옵션' && (
        <div className='grid grid-cols-2 gap-4'>
          {[...options, ...packages].map(item => (
            <Item
              key={item.option_id}
              image={item.option_img_url}
              name={item.option_name}
              price={item.price}
              description={item.comment}
            />
          ))}
        </div>
      )}
    </>
  );
}

export default CarOption;
