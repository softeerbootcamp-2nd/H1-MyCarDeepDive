import { useEffect } from 'react';
import UnderLine from '@/Components/UnderLine';
import RecommendResultPageWrapper from './RecommendResultPageWrapper';
import CardWrapper from './CardWrapper';
import BackgroundGradient from './BackgroundGradient';
import Card from './Card';
import RecommendCarWrapper from './RecommendCarWrapper';
import RecommendCarBackground from './RecommendCarBackground';
import RecommendCarSummary from './RecommendCarSummary';
import RecommendBody from './RecommendBody';
import RecommendCarInfo from './RecommendCarInfo';
import RecommendCarOption from './RecommendCarOption';
import RecommendTotalPrice from './RecommendTotalPrice';
import BottomButtons from './BottomButtons';
import palisade from '@/assets/image/Palisade.png';
import exteriorCrimi from '@/assets/image/exterior-crimi.png';
import exteriorArtificialLeather from '@/assets/image/exterior-artificial-leather.png';
import exteriorSmartsense from '@/assets/image/exterior-smartsense.png';

const cardData = {
  title: '펠리세이드 - Le Blanc(르블랑)',
  description: {
    accent: '가족',
    general: '을 생각하는 당신을 위한 펠리세이드',
  },
  image: palisade,
  bubble: '우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요',
};

const tagData = ['1년 이하', '1인', '출퇴근용', '디자인', '4200만원'];

const carData = {
  name: '펠리세이드',
  trim: 'Le Blanc(르블랑)',
  price: '43,460,000',
  feature: '가솔린 ・ 2WD ・ 8인승',
};

const optionData = [
  {
    title: '색상',
    data: [
      {
        image: exteriorCrimi,
        name: '외장 - 크리미 화이트 펄',
        price: '0',
        description: '75%의 20~30대 구매자들이 선택했어요.',
      },
      {
        image: exteriorArtificialLeather,
        name: '내장 - 인조가죽 (블랙)',
        price: '0',
        description: '65%의 20~30대 구매자들이 선택했어요.',
      },
    ],
  },
  {
    title: '옵션',
    data: [
      {
        image: exteriorArtificialLeather,
        name: '컴포트 II',
        price: '1,090,000',
        description:
          '해당 옵션이 후석 승객 알림이 있어서 좋아요. 뒷좌석 아이들을 확인할 수 있거든요.',
      },
      {
        image: exteriorSmartsense,
        name: '현대 스마트센스 I',
        price: '790,000',
        description:
          '전방 충돌 방지 보조 기능이 있어 안전을 위해서라면 꼭 추가해야 하는 옵션이에요.',
      },
    ],
  },
];

interface RecommendResultPageProps {
  step: string;
}

function ResultPage({ step }: RecommendResultPageProps) {
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  return (
    <RecommendResultPageWrapper>
      {step === 'basic' ? (
        <CardWrapper>
          <BackgroundGradient />
          <Card cardData={cardData} />
        </CardWrapper>
      ) : (
        <RecommendCarWrapper>
          <RecommendCarBackground />
          <RecommendCarSummary tag={tagData} carImage={palisade} />
        </RecommendCarWrapper>
      )}
      <RecommendBody>
        <RecommendCarInfo carData={carData} />
        <UnderLine margin={'mt-4 mb-[26px]'} />
        <RecommendCarOption
          title={optionData[0].title}
          optionData={optionData[0].data}
        />
        <UnderLine margin={'mt-10 mb-6'} />
        <RecommendCarOption
          title={optionData[1].title}
          optionData={optionData[1].data}
        />
        <UnderLine margin={'mt-10 mb-4'} />
        <RecommendTotalPrice totalPrice={'48,120,000'} />
        <BottomButtons />
      </RecommendBody>
    </RecommendResultPageWrapper>
  );
}

export default ResultPage;
