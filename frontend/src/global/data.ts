import lifeStyleProfile1 from '@/assets/image/lifeStyle-profile1.png';
import lifeStyleProfile2 from '@/assets/image/lifeStyle-profile2.png';
import lifeStyleProfile3 from '@/assets/image/lifeStyle-profile3.png';
import lifeStyleProfile4 from '@/assets/image/lifeStyle-profile4.png';

import Exclusive from '@/assets/image/Exclusive.png';
import LeBlanc from '@/assets/image/LeBlanc.png';
import Prestige from '@/assets/image/Prestige.png';
import Calligraphy from '@/assets/image/Calligraphy.png';
import basicWheel from '@/assets/icon/Basic-wheel.svg';
import alloyWheel from '@/assets/icon/Alloy-wheel.svg';
import sheet from '@/assets/icon/Sheet.svg';
import navigation from '@/assets/icon/Navigation.svg';
import cluster from '@/assets/icon/Cluster.svg';

export const ageQuestionList = ['20대', '30대', '40대', '50대 이상'];
export const lifeStyleQuestionList = [
  {
    value: '1',
    tags: ['#주행안전', '#사용편의'],
    description: '가족과 함께 타서\n안전을 중시해요.',
    profileImage: lifeStyleProfile1,
  },
  {
    value: '2',
    tags: ['#사용편의', '#추위/더위'],
    description: '매일 출퇴근하여 경제적이고\n편안한 주행을 원해요.',
    profileImage: lifeStyleProfile2,
  },
  {
    value: '3',
    tags: ['#주행안전', '#주차/출차'],
    description: '운전 경력이 짧아\n똑똑한 주행을 원해요.',
    profileImage: lifeStyleProfile3,
  },
  {
    value: '4',
    tags: ['#스타일', '#퍼포먼스'],
    description: '트렌드에 민감해\n디자인과 성능이 중요해요.',
    profileImage: lifeStyleProfile4,
  },
];

export const lifeStyleAdditionQuestionList = [
  {
    value: 'drivingExperience',
    question: '운전 경력이 어떻게 되시나요?',
    answerList: ['1년 이하', '1년 이상 ~ 5년 미만', '5년 이상'],
  },
  {
    value: 'numberOfFamilyMembers',
    question: '가족 구성원이 몇 명인가요?',
    answerList: ['1인', '2인', '3-4인', '5인 이상'],
  },
  {
    value: 'purpose',
    question: '어떤 목적으로 주로 차를 타시나요?',
    answerList: ['출퇴근용', '레저용', '가정용', '업무용'],
  },
  {
    value: 'value',
    question: '자동차를 살 때 어떤 가치가 가장 중요한가요?',
    answerList: ['디자인', '성능', '안전', '편의성'],
  },
];

export const price = {
  lowestPrice: 4200,
  highestPrice: 6900,
  rangeUnit: 300,
  priceUnit: '만원',
};

export const trimCompareData = [
  {
    carImage: Exclusive,
    forYou: '합리적인 당신을 위한',
    trimName: 'Exclusive',
    price: '₩40,440,000',
    exteriorColor: [
      '#121212',
      '#979999',
      '#171D2F',
      '#292622',
      '#313433',
      '#F2F4F3',
    ],
    interiorColor: '인조가죽(블랙)',
    wheelImage: basicWheel,
    wheelSize: '18 inch',
    wheelName: '기본 휠',
    sheetImage: sheet,
    sheetName: '인조/천연가죽 시트',
    navigationImage: navigation,
    navigationSize: '12.3 inch',
    navigationName: '네비게이션',
    clusterImage: cluster,
    clusterSize: '4.2 inch',
    clusterName: '클러스터',
    basicOption: [
      '전방 충돌 방지 보조',
      '내비 기반 크루즈 컨트롤',
      '세이프티 파워 윈도우',
    ],
  },
  {
    carImage: LeBlanc,
    forYou: '필수적인 옵션만 모은',
    trimName: 'Le Blanc(르블랑)',
    price: '₩43,460,000',
    exteriorColor: [
      '#121212',
      '#979999',
      '#171D2F',
      '#292622',
      '#313433',
      '#F2F4F3',
    ],
    interiorColor: '쿨그레이 퀄팅천연(블랙)',
    wheelImage: alloyWheel,
    wheelSize: '20 inch',
    wheelName: '알로이 휠',
    sheetImage: sheet,
    sheetName: '퀼팅 천연가죽 시트',
    navigationImage: navigation,
    navigationSize: '12.3 inch',
    navigationName: '네비게이션',
    clusterImage: cluster,
    clusterSize: '12.3 inch',
    clusterName: '클러스터',
    basicOption: [
      '퀼팅 천연가죽 시트',
      '12인치 클러스터',
      '서라운드 뷰 모니터',
    ],
  },
  {
    carImage: Prestige,
    forYou: '가치있는 드라이빙을 위한',
    trimName: 'Prestige',
    price: '₩47,720,000',
    exteriorColor: [
      '#121212',
      '#979999',
      '#171D2F',
      '#292622',
      '#313433',
      '#F2F4F3',
    ],
    interiorColor: '네이비 블랙 버건디',
    wheelImage: alloyWheel,
    wheelSize: '20 inch',
    wheelName: '알로이 휠',
    sheetImage: sheet,
    sheetName: '퀼팅 나파가죽 시트',
    navigationImage: navigation,
    navigationSize: '12.3 inch',
    navigationName: '네비게이션',
    clusterImage: cluster,
    clusterSize: '12.3 inch',
    clusterName: '클러스터',
    basicOption: ['2열 통풍시트', '스마트 자세제어', '2열 수동식 도어 커튼'],
  },
  {
    carImage: Calligraphy,
    forYou: '남들과 차별화된 경험',
    trimName: 'Calligraphy',
    price: '₩52,540,000',
    exteriorColor: [
      '#121212',
      '#A1A3A2',
      '#142419',
      '#181F30',
      '#2C2925',
      '#3C3F3E',
      '#F1F2F3',
    ],
    interiorColor: '블랙(고급) 브라운',
    interiorColor2: '블랙 원톤(블랙에디션 전용)',
    wheelImage: alloyWheel,
    wheelSize: '20 inch',
    wheelName: '캘리그라피 전용 휠',
    sheetImage: sheet,
    sheetName: '퀼팅 나파가죽 시트 (캘리그라피 전용)',
    navigationImage: navigation,
    navigationSize: '12.3 inch',
    navigationName: '네비게이션',
    clusterImage: cluster,
    clusterSize: '12.3 inch',
    clusterName: '클러스터',
    basicOption: [
      '20인치 캘리그라피 전용 휠',
      'KRELL 프리미엄 사운드',
      '블랙 에디션',
    ],
  },
];
