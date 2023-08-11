import UnderLine from '@/Components/UnderLine';
import DetailInfo from './DetailInfo';

interface InformationItemProps {
  image: string;
  name: string;
  description: string;
  detail: {
    key: string;
    value: string;
  }[];
}

function Item({ image, name, description, detail }: InformationItemProps) {
  return (
    <div className='mb-5 mx-10 flex gap-8'>
      <img src={image} alt={name} className='w-[320px]' />
      <div className='flex flex-col gap-3 w-[330px]'>
        <span className='font-h1-medium text-grey-100'>{name}</span>
        <span className='font-body4-regular text-grey-100'>{description}</span>
        <UnderLine margin='' />
        <div className='flex flex-col gap-1'>
          {detail.map(item => (
            <DetailInfo datail={item} key={item.key} />
          ))}
        </div>
      </div>
    </div>
  );
}

export default Item;
