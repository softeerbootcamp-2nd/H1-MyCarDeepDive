import Tag from './Tag';
import Description from './Description';

interface RecommendCarSummaryProps {
  tag: string[];
  carImage: string;
}

function RecommendCarSummary({ tag, carImage }: RecommendCarSummaryProps) {
  return (
    <div className='w-full h-[334px] absolute top-0 left-0'>
      <div className='w-[1280px] h-full mx-auto relative'>
        <div className='absolute top-16 left-[336px]'>
          <div className='flex gap-1.5'>
            {tag.map(item => (
              <Tag tagItem={item} key={item} />
            ))}
          </div>
          <Description />
        </div>
        <img
          src={carImage}
          alt='Recommend-Car'
          className='h-[334px] object-cover absolute top-0 right-12'
        />
      </div>
    </div>
  );
}

export default RecommendCarSummary;
