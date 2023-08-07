import lifeStyleProfile1 from '@/assets/image/lifeStyle-profile1.png';
import lifeStyleProfile2 from '@/assets/image/lifeStyle-profile2.png';
import lifeStyleProfile3 from '@/assets/image/lifeStyle-profile3.png';
import lifeStyleProfile4 from '@/assets/image/lifeStyle-profile4.png';

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
