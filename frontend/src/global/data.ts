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

import Abyss from '@/assets/image/exterior-abyss.png';
import Shimmering from '@/assets/image/exterior-shimmering.png';
import Moonlight from '@/assets/image/exterior-moonlight.png';
import Gaia from '@/assets/image/exterior-gaia.png';
import Graphite from '@/assets/image/exterior-graphite.png';
import Creamy from '@/assets/image/exterior-creamy.png';
import Quilted from '@/assets/image/interior-quilted.png';
import Robust from '@/assets/image/exterior-robust.png';
import CoolGray from '@/assets/image/interior-coolgray.png';
import Black from '@/assets/image/interior-black.png';
import Navy from '@/assets/image/interior-navy.png';
import SyntheticBlack from '@/assets/image/interior-synthetic_black.png';
import Burgundy from '@/assets/image/interior-burgundy.png';
import NavyWarmGray from '@/assets/image/interior-navy_warmgray.png';
import PremiumBlack from '@/assets/image/interior-premium_black.png';
import OneToneBlack from '@/assets/image/interior-onetone_balck.png';
import Brown from '@/assets/image/interior-brown.png';

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

export const carSpecData = [
  {
    car_spec_id: 1,
    trim_id: 1,
    trim_name: 'Exclusive',
    price: 43460100,
    summary: '합리적인 당신을 위한',
    basic_option_ids: [1, 2, 3],
    basic_option_names: [
      '12인치 내비게이션',
      '내비 기반 크루즈 컨트롤',
      '세이프티 파워 윈도우',
    ],
  },
  {
    car_spec_id: 2,
    trim_id: 2,
    trim_name: 'Le Blanc',
    price: 43460200,
    summary: '필수적인 옵션만 모은',
    basic_option_ids: [4, 5, 6],
    basic_option_names: [
      '20인치 알로이 휠',
      '12인치 클러스터',
      '서라운드 뷰 모니터',
    ],
  },
  {
    car_spec_id: 3,
    trim_id: 3,
    trim_name: 'Prestige',
    price: 43460300,
    summary: '가치있는 드라이빙 경험을 주는',
    basic_option_ids: [7, 8, 9],
    basic_option_names: [
      '2열 통풍시트',
      '스마트 자세제어',
      '2열 수동식 도어 커튼',
    ],
  },
  {
    car_spec_id: 4,
    trim_id: 4,
    trim_name: 'Caligraphy',
    price: 43460400,
    summary: '남들과 차별화된 경험',
    basic_option_ids: [10, 11, 12],
    basic_option_names: [
      '20인치 캘리그라피 전용 휠',
      'KRELL 프리미엄 사운드',
      '블랙 에디션',
    ],
  },
];

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
    trimName: 'Le Blanc',
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

export const allColorData = {
  1: {
    exteriorColors: {
      availableColors: {
        1: {
          name: '크리미 화이트 펄',
          imgUrl: '/assets/image/exterior-creamy.png',
          carImgUrls: '/palisade/white/image_',
          price: 100000,
          chooseRate: 80,
        },
        2: {
          name: '어비스 블랙펄',
          imgUrl: '/assets/image/exterior-abyss.png',
          carImgUrls: '/palisade/abyss/image_',
          price: 0,
          chooseRate: 70,
        },
        3: {
          name: '쉬머링 실버 메탈릭',
          imgUrl: '/assets/image/exterior-shimmering.png',
          carImgUrls: '/palisade/silver/image_',
          price: 0,
          chooseRate: 60,
        },
        4: {
          name: '문라이트 블루 펄',
          imgUrl: '/assets/image/exterior-moonlight.png',
          carImgUrls: '/palisade/blue/image_',
          price: 0,
          chooseRate: 50,
        },
        5: {
          name: '가이아 브라운 펄',
          imgUrl: '/assets/image/exterior-gaia.png',
          carImgUrls: '/palisade/brown/image_',
          price: 0,
          chooseRate: 40,
        },
        6: {
          name: '그라파이트 그레이 메탈릭',
          imgUrl: '/assets/image/exterior-graphite.png',
          carImgUrls: '/palisade/gray/image_',
          price: 0,
          chooseRate: 30,
        },
      },
      unAvailableColors: {},
      otherTrimColors: {
        7: {
          name: '로버스트 에메랄드 펄',
          imgUrl: '/assets/image/exterior-robust.png',
          carImgUrls: '/palisade/robust/image_',
          price: 40000,
          chooseRate: 70,
        },
      },
    },
    interiorColors: {
      availableColors: {
        1: {
          name: '퀄팅 천연(블랙)',
          imgUrl: '/assets/image/interior-quilted.png',
          carImgUrls: '',
          price: 50000,
          chooseRate: 70,
        },
        2: {
          name: '쿨 그레이',
          imgUrl: '/assets/image/interior-coolgray.png',
          carImgUrls: '',
          price: 70000,
          chooseRate: 60,
        },
      },
      unAvailableColors: {},
      otherTrimColors: {
        3: {
          name: '인조가죽(블랙)',
          imgUrl: '/assets/image/interior-articifial-leather-black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 70,
        },
        4: {
          name: '네이비',
          imgUrl: '/assets/image/interior-navy.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 60,
        },
        5: {
          name: '블랙',
          imgUrl: '/assets/image/interior-black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 50,
        },
        6: {
          name: '버건디',
          imgUrl: '/assets/image/interior-burgundy.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 40,
        },
        7: {
          name: '네이비/웜그레이 투톤',
          imgUrl: '/assets/image/interior-navy_warmgray.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 30,
        },
        8: {
          name: '블랙(고급)',
          imgUrl: '/assets/image/interior-premium_black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 20,
        },
        9: {
          name: '블랙원톤(블랙에디션전용)',
          imgUrl: '/assets/image/interior-onetone_black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 10,
        },
        10: {
          name: '브라운',
          imgUrl: '/assets/image/interior-brown.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 5,
        },
      },
    },
  },

  2: {
    exteriorColors: {
      availableColors: {
        1: {
          name: '크리미 화이트 펄',
          imgUrl: '/assets/image/exterior-creamy.png',
          carImgUrls: '/palisade/white/image_',
          price: 100000,
          chooseRate: 80,
        },
        2: {
          name: '어비스 블랙펄',
          imgUrl: '/assets/image/exterior-abyss.png',
          carImgUrls: '/palisade/abyss/image_',
          price: 0,
          chooseRate: 70,
        },
        3: {
          name: '쉬머링 실버 메탈릭',
          imgUrl: '/assets/image/exterior-shimmering.png',
          carImgUrls: '/palisade/silver/image_',
          price: 0,
          chooseRate: 60,
        },
        4: {
          name: '문라이트 블루 펄',
          imgUrl: '/assets/image/exterior-moonlight.png',
          carImgUrls: '/palisade/blue/image_',
          price: 0,
          chooseRate: 50,
        },
        5: {
          name: '가이아 브라운 펄',
          imgUrl: '/assets/image/exterior-gaia.png',
          carImgUrls: '/palisade/brown/image_',
          price: 0,
          chooseRate: 40,
        },
        6: {
          name: '그라파이트 그레이 메탈릭',
          imgUrl: '/assets/image/exterior-graphite.png',
          carImgUrls: '/palisade/gray/image_',
          price: 0,
          chooseRate: 30,
        },
      },
      unAvailableColors: {},
      otherTrimColors: {
        7: {
          name: '로버스트 에메랄드 펄',
          imgUrl: '/assets/image/exterior-robust.png',
          carImgUrls: '/palisade/robust/image_',
          price: 40000,
          chooseRate: 70,
        },
      },
    },
    interiorColors: {
      availableColors: {
        3: {
          name: '인조가죽(블랙)',
          imgUrl: '/assets/image/interior-synthtic_black.png',
          carImgUrls: '',
          price: 50000,
          chooseRate: 40,
        },
      },
      unAvailableColors: {},
      otherTrimColors: {
        1: {
          name: '퀄팅 천연(블랙)',
          imgUrl: '/assets/image/interior-quilted.png',
          carImgUrls: '',
          price: 50000,
          chooseRate: 70,
        },
        2: {
          name: '쿨 그레이',
          imgUrl: '/assets/image/interior-coolgray.png',
          carImgUrls: '',
          price: 70000,
          chooseRate: 60,
        },
        4: {
          name: '네이비',
          imgUrl: '/assets/image/interior-navy.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 60,
        },
        5: {
          name: '블랙',
          imgUrl: '/assets/image/interior-black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 50,
        },
        6: {
          name: '버건디',
          imgUrl: '/assets/image/interior-burgundy.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 40,
        },
        7: {
          name: '네이비/웜그레이 투톤',
          imgUrl: '/assets/image/interior-navy_warmgray.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 30,
        },
        8: {
          name: '블랙(고급)',
          imgUrl: '/assets/image/interior-premium_black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 20,
        },
        9: {
          name: '블랙원톤(블랙에디션전용)',
          imgUrl: '/assets/image/interior-onetone_black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 10,
        },
        10: {
          name: '브라운',
          imgUrl: '/assets/image/interior-brown.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 5,
        },
      },
    },
  },

  3: {
    exteriorColors: {
      availableColors: {
        1: {
          name: '크리미 화이트 펄',
          imgUrl: '/assets/image/exterior-creamy.png',
          carImgUrls: '/palisade/white/image_',
          price: 100000,
          chooseRate: 80,
        },
        2: {
          name: '어비스 블랙펄',
          imgUrl: '/assets/image/exterior-abyss.png',
          carImgUrls: '/palisade/abyss/image_',
          price: 0,
          chooseRate: 70,
        },
        3: {
          name: '쉬머링 실버 메탈릭',
          imgUrl: '/assets/image/exterior-shimmering.png',
          carImgUrls: '/palisade/silver/image_',
          price: 0,
          chooseRate: 60,
        },
        4: {
          name: '문라이트 블루 펄',
          imgUrl: '/assets/image/exterior-moonlight.png',
          carImgUrls: '/palisade/blue/image_',
          price: 0,
          chooseRate: 50,
        },
        5: {
          name: '가이아 브라운 펄',
          imgUrl: '/assets/image/exterior-gaia.png',
          carImgUrls: '/palisade/brown/image_',
          price: 0,
          chooseRate: 40,
        },
        6: {
          name: '그라파이트 그레이 메탈릭',
          imgUrl: '/assets/image/exterior-graphite.png',
          carImgUrls: '/palisade/gray/image_',
          price: 0,
          chooseRate: 30,
        },
      },
      unAvailableColors: {},
      otherTrimColors: {
        7: {
          name: '로버스트 에메랄드 펄',
          imgUrl: '/assets/image/exterior-robust.png',
          carImgUrls: '/palisade/robust/image_',
          price: 40000,
          chooseRate: 70,
        },
      },
    },
    interiorColors: {
      availableColors: {
        4: {
          name: '네이비',
          imgUrl: '/assets/image/interior-navy.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 60,
        },
        5: {
          name: '블랙',
          imgUrl: '/assets/image/interior-black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 50,
        },
        6: {
          name: '버건디',
          imgUrl: '/assets/image/interior-burgundy.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 40,
        },
      },
      unAvailableColors: {},
      otherTrimColors: {
        1: {
          name: '퀄팅 천연(블랙)',
          imgUrl: '/assets/image/interior-quilted.png',
          carImgUrls: '',
          price: 50000,
          chooseRate: 70,
        },
        2: {
          name: '쿨 그레이',
          imgUrl: '/assets/image/interior-coolgray.png',
          carImgUrls: '',
          price: 70000,
          chooseRate: 60,
        },
        3: {
          name: '인조가죽(블랙)',
          imgUrl: '/assets/image/interior-synthtic_black.png',
          carImgUrls: '',
          price: 50000,
          chooseRate: 40,
        },
        7: {
          name: '네이비/웜그레이 투톤',
          imgUrl: '/assets/image/interior-navy_warmgray.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 30,
        },
        8: {
          name: '블랙(고급)',
          imgUrl: '/assets/image/interior-premium_black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 20,
        },
        9: {
          name: '블랙원톤(블랙에디션전용)',
          imgUrl: '/assets/image/interior-onetone_black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 10,
        },
        10: {
          name: '브라운',
          imgUrl: '/assets/image/interior-brown.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 5,
        },
      },
    },
  },

  4: {
    exteriorColors: {
      availableColors: {
        1: {
          name: '크리미 화이트 펄',
          imgUrl: '/assets/image/exterior-creamy.png',
          carImgUrls: '/palisade/white/image_',
          price: 100000,
          chooseRate: 80,
        },
        2: {
          name: '어비스 블랙펄',
          imgUrl: '/assets/image/exterior-abyss.png',
          carImgUrls: '/palisade/abyss/image_',
          price: 0,
          chooseRate: 70,
        },
        3: {
          name: '쉬머링 실버 메탈릭',
          imgUrl: '/assets/image/exterior-shimmering.png',
          carImgUrls: '/palisade/silver/image_',
          price: 0,
          chooseRate: 60,
        },
        4: {
          name: '문라이트 블루 펄',
          imgUrl: '/assets/image/exterior-moonlight.png',
          carImgUrls: '/palisade/blue/image_',
          price: 0,
          chooseRate: 50,
        },
        5: {
          name: '가이아 브라운 펄',
          imgUrl: '/assets/image/exterior-gaia.png',
          carImgUrls: '/palisade/brown/image_',
          price: 0,
          chooseRate: 40,
        },
        6: {
          name: '그라파이트 그레이 메탈릭',
          imgUrl: '/assets/image/exterior-graphite.png',
          carImgUrls: '/palisade/gray/image_',
          price: 0,
          chooseRate: 30,
        },
        7: {
          name: '로버스트 에메랄드 펄',
          imgUrl: '/assets/image/exterior-robust.png',
          carImgUrls: '/palisade/robust/image_',
          price: 40000,
          chooseRate: 70,
        },
      },
      unAvailableColors: {},
      otherTrimColors: {},
    },
    interiorColors: {
      availableColors: {
        7: {
          name: '네이비/웜그레이 투톤',
          imgUrl: '/assets/image/interior-navy_warmgray.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 30,
        },
        8: {
          name: '블랙(고급)',
          imgUrl: '/assets/image/interior-premium_black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 20,
        },
        9: {
          name: '블랙원톤(블랙에디션전용)',
          imgUrl: '/assets/image/interior-onetone_black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 10,
        },
        10: {
          name: '브라운',
          imgUrl: '/assets/image/interior-brown.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 5,
        },
      },
      unAvailableColors: {},
      otherTrimColors: {
        1: {
          name: '퀄팅 천연(블랙)',
          imgUrl: '/assets/image/interior-quilted.png',
          carImgUrls: '',
          price: 50000,
          chooseRate: 70,
        },
        2: {
          name: '쿨 그레이',
          imgUrl: '/assets/image/interior-coolgray.png',
          carImgUrls: '',
          price: 70000,
          chooseRate: 60,
        },
        3: {
          name: '인조가죽(블랙)',
          imgUrl: '/assets/image/interior-synthtic_black.png',
          carImgUrls: '',
          price: 50000,
          chooseRate: 40,
        },
        4: {
          name: '네이비',
          imgUrl: '/assets/image/interior-navy.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 60,
        },
        5: {
          name: '블랙',
          imgUrl: '/assets/image/interior-black.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 50,
        },
        6: {
          name: '버건디',
          imgUrl: '/assets/image/interior-burgundy.png',
          carImgUrls: '',
          price: 0,
          chooseRate: 40,
        },
      },
    },
  },
};

export const colors = [
  {
    trim: 'Le Blanc',
    exteriorColor: [
      {
        name: '크리미 화이트 펄',
        chooseRate: 90,
        imgUrl: Creamy,
        price: 100000,
      },
      {
        name: '어비스 블랙펄',
        chooseRate: 70,
        imgUrl: Abyss,
        price: 0,
      },
      {
        name: '쉬머링 실버 메탈릭',
        chooseRate: 60,
        imgUrl: Shimmering,
        price: 0,
      },
      {
        name: '문라이트 블루 펄',
        chooseRate: 50,
        imgUrl: Moonlight,
        price: 0,
      },
      {
        name: '가이아 브라운 펄',
        chooseRate: 40,
        imgUrl: Gaia,
        price: 0,
      },
      {
        name: '그라파이트 그레이 메탈릭',
        chooseRate: 30,
        imgUrl: Graphite,
        price: 0,
      },
    ],
    interiorColor: [
      {
        name: '퀄팅 천연(블랙)',
        chooseRate: 70,
        imgUrl: Quilted,
        price: 0,
      },
      {
        name: '쿨 그레이',
        chooseRate: 60,
        imgUrl: CoolGray,
        price: 0,
      },
    ],
    otherExteriorColor: [
      {
        trim: 'Caligraphy',
        name: '로버스트 에메랄드 펄',
        chooseRate: 70,
        imgUrl: Robust,
        price: 0,
      },
    ],
    otherInteriorColor: [
      {
        trim: 'Exclusive',
        name: '인조가죽(블랙)',
        chooseRate: 70,
        imgUrl: SyntheticBlack,
        price: 0,
      },
      {
        trim: 'Prestige',
        name: '네이비',
        chooseRate: 60,
        imgUrl: Navy,
        price: 0,
      },
      {
        trim: 'Prestige',
        name: '블랙',
        chooseRate: 50,
        imgUrl: Black,
        price: 0,
      },
      {
        trim: 'Prestige',
        name: '버건디',
        chooseRate: 40,
        imgUrl: Burgundy,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '네이비/웜그레이 투톤',
        chooseRate: 30,
        imgUrl: NavyWarmGray,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '블랙(고급)',
        chooseRate: 20,
        imgUrl: PremiumBlack,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '블랙원톤(블랙에디션전용)',
        chooseRate: 10,
        imgUrl: OneToneBlack,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '브라운',
        chooseRate: 5,
        imgUrl: Brown,
        price: 0,
      },
    ],
  },

  {
    trim: 'Exclusive',
    exteriorColor: [
      {
        name: '크리미 화이트 펄',
        chooseRate: 90,
        imgUrl: Creamy,
        price: 100000,
      },
      {
        name: '어비스 블랙펄',
        chooseRate: 70,
        imgUrl: Abyss,
        price: 0,
      },
      {
        name: '쉬머링 실버 메탈릭',
        chooseRate: 60,
        imgUrl: Shimmering,
        price: 0,
      },
      {
        name: '문라이트 블루 펄',
        chooseRate: 50,
        imgUrl: Moonlight,
        price: 0,
      },
      {
        name: '가이아 브라운 펄',
        chooseRate: 40,
        imgUrl: Gaia,
        price: 0,
      },
      {
        name: '그라파이트 그레이 메탈릭',
        chooseRate: 30,
        imgUrl: Graphite,
        price: 0,
      },
    ],
    interiorColor: [
      {
        name: '인조가죽(블랙)',
        chooseRate: 70,
        imgUrl: SyntheticBlack,
        price: 0,
      },
    ],
    otherExteriorColor: [
      {
        trim: 'Caligraphy',
        name: '로버스트 에메랄드 펄',
        chooseRate: 70,
        imgUrl: Robust,
        price: 0,
      },
    ],
    otherInteriorColor: [
      {
        trim: 'Le Blanc',
        name: '퀄팅 천연(블랙)',
        chooseRate: 70,
        imgUrl: Quilted,
        price: 0,
      },
      {
        trim: 'Le Blanc',
        name: '쿨 그레이',
        chooseRate: 60,
        imgUrl: CoolGray,
        price: 0,
      },
      {
        trim: 'Prestige',
        name: '네이비',
        chooseRate: 60,
        imgUrl: Navy,
        price: 0,
      },
      {
        trim: 'Prestige',
        name: '블랙',
        chooseRate: 50,
        imgUrl: Black,
        price: 0,
      },
      {
        trim: 'Prestige',
        name: '버건디',
        chooseRate: 40,
        imgUrl: Burgundy,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '네이비/웜그레이 투톤',
        chooseRate: 30,
        imgUrl: NavyWarmGray,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '블랙(고급)',
        chooseRate: 20,
        imgUrl: PremiumBlack,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '블랙원톤(블랙에디션전용)',
        chooseRate: 10,
        imgUrl: OneToneBlack,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '브라운',
        chooseRate: 5,
        imgUrl: Brown,
        price: 0,
      },
    ],
  },
  {
    trim: 'Prestige',
    exteriorColor: [
      {
        name: '크리미 화이트 펄',
        chooseRate: 90,
        imgUrl: Creamy,
        price: 100000,
      },
      {
        name: '어비스 블랙펄',
        chooseRate: 70,
        imgUrl: Abyss,
        price: 0,
      },
      {
        name: '쉬머링 실버 메탈릭',
        chooseRate: 60,
        imgUrl: Shimmering,
        price: 0,
      },
      {
        name: '문라이트 블루 펄',
        chooseRate: 50,
        imgUrl: Moonlight,
        price: 0,
      },
      {
        name: '가이아 브라운 펄',
        chooseRate: 40,
        imgUrl: Gaia,
        price: 0,
      },
      {
        name: '그라파이트 그레이 메탈릭',
        chooseRate: 30,
        imgUrl: Graphite,
        price: 0,
      },
    ],
    interiorColor: [
      {
        name: '네이비',
        chooseRate: 60,
        imgUrl: Navy,
        price: 0,
      },
      {
        name: '블랙',
        chooseRate: 50,
        imgUrl: Black,
        price: 0,
      },
      {
        name: '버건디',
        chooseRate: 40,
        imgUrl: Burgundy,
        price: 0,
      },
    ],
    otherExteriorColor: [
      {
        trim: 'Caligraphy',
        name: '로버스트 에메랄드 펄',
        chooseRate: 70,
        imgUrl: Robust,
        price: 0,
      },
    ],
    otherInteriorColor: [
      {
        trim: 'Le Blanc',
        name: '퀄팅 천연(블랙)',
        chooseRate: 70,
        imgUrl: Quilted,
        price: 0,
      },
      {
        trim: 'Le Blanc',
        name: '쿨 그레이',
        chooseRate: 60,
        imgUrl: CoolGray,
        price: 0,
      },
      {
        trim: 'Exclusive',
        name: '인조가죽(블랙)',
        chooseRate: 70,
        imgUrl: SyntheticBlack,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '네이비/웜그레이 투톤',
        chooseRate: 30,
        imgUrl: NavyWarmGray,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '블랙(고급)',
        chooseRate: 20,
        imgUrl: PremiumBlack,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '블랙원톤(블랙에디션전용)',
        chooseRate: 10,
        imgUrl: OneToneBlack,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '브라운',
        chooseRate: 5,
        imgUrl: Brown,
        price: 0,
      },
    ],
  },
  {
    trim: 'Caligraphy',
    exteriorColor: [
      {
        name: '크리미 화이트 펄',
        chooseRate: 90,
        imgUrl: Creamy,
        price: 100000,
      },
      {
        name: '어비스 블랙펄',
        chooseRate: 70,
        imgUrl: Abyss,
        price: 0,
      },
      {
        name: '쉬머링 실버 메탈릭',
        chooseRate: 60,
        imgUrl: Shimmering,
        price: 0,
      },
      {
        name: '문라이트 블루 펄',
        chooseRate: 50,
        imgUrl: Moonlight,
        price: 0,
      },
      {
        name: '로버스트 에메랄드 펄',
        chooseRate: 70,
        imgUrl: Robust,
        price: 0,
      },
      {
        name: '가이아 브라운 펄',
        chooseRate: 40,
        imgUrl: Gaia,
        price: 0,
      },
      {
        name: '그라파이트 그레이 메탈릭',
        chooseRate: 30,
        imgUrl: Graphite,
        price: 0,
      },
    ],
    interiorColor: [
      {
        trim: 'Caligraphy',
        name: '네이비/웜그레이 투톤',
        chooseRate: 30,
        imgUrl: NavyWarmGray,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '블랙(고급)',
        chooseRate: 20,
        imgUrl: PremiumBlack,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '블랙원톤(블랙에디션전용)',
        chooseRate: 10,
        imgUrl: OneToneBlack,
        price: 0,
      },
      {
        trim: 'Caligraphy',
        name: '브라운',
        chooseRate: 5,
        imgUrl: Brown,
        price: 0,
      },
    ],
    otehrExteriorColor: [{}],
    otherInteriorColor: [
      {
        trim: 'Le Blanc',
        name: '퀄팅 천연(블랙)',
        chooseRate: 70,
        imgUrl: Quilted,
        price: 0,
      },
      {
        trim: 'Le Blanc',
        name: '쿨 그레이',
        chooseRate: 60,
        imgUrl: CoolGray,
        price: 0,
      },
      {
        trim: 'Exclusive',
        name: '인조가죽(블랙)',
        chooseRate: 70,
        imgUrl: SyntheticBlack,
        price: 0,
      },
      {
        trim: 'Prestige',
        name: '네이비',
        chooseRate: 60,
        imgUrl: Navy,
        price: 0,
      },
      {
        trim: 'Prestige',
        name: '블랙',
        chooseRate: 50,
        imgUrl: Black,
        price: 0,
      },
      {
        trim: 'Prestige',
        name: '버건디',
        chooseRate: 40,
        imgUrl: Burgundy,
        price: 0,
      },
    ],
  },
];
