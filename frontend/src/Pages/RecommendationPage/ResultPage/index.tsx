import { useEffect } from 'react';
import { useParams } from 'react-router-dom';
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
import getRecommendation from '@/api/Recommendation/getRecommendation';
import getCustomRecommendation from '@/api/Recommendation/getCustomRecommendation';

function ResultPage() {
  const { step } = useParams();
  const recommendResult =
    step === 'basic' ? getRecommendation() : getCustomRecommendation();

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
          <CarSummary carImage={recommendResult.data.car_img_url} />
        </CarWrapper>
      )}
      <Body>
        <CarInfo {...recommendResult.data} />
        <UnderLine margin={'mt-4 mb-[26px]'} />
        <CarOption title='색상' {...recommendResult.data} />
        <UnderLine margin={'mt-10 mb-6'} />
        <CarOption title='옵션' {...recommendResult.data} />
        <UnderLine margin={'mt-10 mb-4'} />
        <TotalPrice total_price={recommendResult.data.total_price} />
        <Buttons {...recommendResult.data} />
      </Body>
    </RecommendResultPageWrapper>
  );
}

export default ResultPage;
