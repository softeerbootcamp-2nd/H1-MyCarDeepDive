import { useEffect } from 'react';
import UnderLine from '@/Components/UnderLine';
import RecommendResultPageWrapper from './RecommendResultPageWrapper';
import CardWrapper from './CardWrapper';
import Gradient from './Gradient';
import Card from './Card';
import CarWrapper from './CarWrapper';
import CarBackground from './CarBackground';
import CarSummary from './CarSummary';
import Body from './Body';
import CarInfo from './CarInfo';
import CarOption from './CarOption';
import TotalPrice from './TotalPrice';
import Buttons from './Buttons';
import palisade from '@/assets/image/Palisade.png';
import { useParams } from 'react-router-dom';
import getRecommendation from '@/api/Recommendation/getRecommendation';

const tagData = ['1년 이하', '1인', '출퇴근용', '디자인', '4200만원'];

function ResultPage() {
  const { step } = useParams();
  const recommendResult = getRecommendation();

  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  if (recommendResult === undefined) return null;
  return (
    <RecommendResultPageWrapper>
      {step === 'basic' ? (
        <CardWrapper>
          <Gradient />
          <Card {...recommendResult.data} />
        </CardWrapper>
      ) : (
        <CarWrapper>
          <CarBackground />
          <CarSummary tag={tagData} carImage={palisade} />
        </CarWrapper>
      )}
      <Body>
        <CarInfo {...recommendResult.data} />
        <UnderLine margin={'mt-4 mb-[26px]'} />
        <CarOption title='색상' {...recommendResult.data} />
        <UnderLine margin={'mt-10 mb-6'} />
        <CarOption title='옵션' {...recommendResult.data} />
        <UnderLine margin={'mt-10 mb-4'} />
        <TotalPrice totalPrice={recommendResult.data.totalPrice} />
        <Buttons />
      </Body>
    </RecommendResultPageWrapper>
  );
}

export default ResultPage;
