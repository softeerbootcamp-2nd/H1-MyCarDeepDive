import lifeStyleProfile1 from '@/assets/image/lifeStyle-profile1.png';
import lifeStyleProfile2 from '@/assets/image/lifeStyle-profile2.png';
import lifeStyleProfile3 from '@/assets/image/lifeStyle-profile3.png';
import lifeStyleProfile4 from '@/assets/image/lifeStyle-profile4.png';

import diesel from '@/assets/image/diesel.png';
import gasoline from '@/assets/image/gasoline.png';
import body7 from '@/assets/image/body7.jpeg';
import body8 from '@/assets/image/body8.jpeg';
import wd2 from '@/assets/image/wd2.jpeg';
import wd4 from '@/assets/image/wd4.jpeg';

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
    value: 'lifeValue',
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

export const carFeatureList = [
  {
    type: 'engine',
    description: '엔진',
    valueList: ['디젤 2.2', '가솔린 3.8'],
  },
  {
    type: 'body',
    description: '바디',
    valueList: ['7인승', '8인승'],
  },
  {
    type: 'drivingSystem',
    description: '구동방식',
    valueList: ['2WD', '4WD'],
  },
];

export const engineData = [
  {
    image: diesel,
    name: '디젤 2.2',
    description:
      '높은 토크로 파워풀한 드라이빙이 가능하며, 차급대비 연비 효율이 우수합니다.',
    detail: [
      {
        key: '최고출력',
        value: '202/3,800 PS/rpm',
      },
      {
        key: '최대토크',
        value: '45.0/1,750~2,750 kgf-m/rpm',
      },
    ],
  },
  {
    image: gasoline,
    name: '가솔린 3.8',
    description:
      '고마력의 우수한 가속 성능을 확보하여, 넉넉하고 안정감 있는 주행이 가능합니다엔진의 진동이 적어 편안하고 조용한 드라이빙 감성을 제공합니다.',
    detail: [
      {
        key: '최고출력',
        value: '295/6,000 PS/rpm',
      },
      {
        key: '최대토크',
        value: '36.2/5,200 kgf-m/rpm',
      },
    ],
  },
];

export const bodyData = [
  {
    image: body7,
    name: '7인승',
    description:
      '기존 8인승 시트(1열 2명, 2열 3명, 3열 3명)에서 2열 가운데 시트를 없애 2열 탑승객의 편의는 물론, 3열 탑승객의 승하차가 편리합니다.',
  },
  {
    image: body8,
    name: '8인승',
    description:
      '1열 2명, 2열 3명, 3열 3명이 탑승할 수 있는 구조로, 많은 인원이 탑승할 수 있도록 배려하였습니다.',
  },
];

export const drivingSystemData = [
  {
    image: wd2,
    name: '2WD',
    description:
      '엔진에서 전달되는 동력이 전/후륜 바퀴 중 한쪽으로만 전달되어 차량을 움직이는 방식입니다. 차체가 가벼워 연료 효율이 높습니다.',
  },
  {
    image: wd4,
    name: '4WD',
    description:
      '전자식 상시 4륜 구동 시스템 입니다. 도로의 상황이나 주행 환경에 맞춰 전후륜 구동력을 자동배분하여 주행 안전성을 높여줍니다.',
  },
];
