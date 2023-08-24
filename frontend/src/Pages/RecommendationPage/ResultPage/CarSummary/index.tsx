import { useContext } from 'react';
import { QuestionContext } from '@/context/QuestionProvider';
import Tag from './Tag';
import Description from './Description';

interface RecommendCarSummaryProps {
  carImage: string;
}

function CarSummary({ carImage }: RecommendCarSummaryProps) {
  const { myLifeStyle } = useContext(QuestionContext);
  const tag = [
    myLifeStyle.drivingExperience,
    myLifeStyle.numberOfFamilyMembers,
    myLifeStyle.purpose,
    myLifeStyle.lifeValue,
    myLifeStyle.budget + '만원',
  ];

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
          src={'https://' + carImage}
          alt='Recommend-Car'
          className='h-[334px] object-cover absolute top-0 right-12'
        />
      </div>
    </div>
  );
}

export default CarSummary;
