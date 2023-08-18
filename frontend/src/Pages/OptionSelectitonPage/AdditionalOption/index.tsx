import { useEffect } from 'react';
import Option from './Option';
import comport2 from '@/assets/image/option-comport.png';
import smartsense from '@/assets/image/option-smartsense.png';
import parking from '@/assets/image/option-parking.png';
import sheet from '@/assets/image/option-sheet.png';
import sunroof from '@/assets/image/option-sunroof.png';
import cam from '@/assets/image/option-cam.png';
import mufler from '@/assets/image/option-mufler.png';
import air from '@/assets/image/option-air.png';
import sideStep from '@/assets/image/option-sidestep.png';
import knee from '@/assets/image/option-knee.png';
import film from '@/assets/image/option-film.png';
import production from '@/assets/image/option-production.png';
import dark20 from '@/assets/image/option-20dark.png';
import black20 from '@/assets/image/option-20black.png';
import alcon from '@/assets/image/option-alcon.png';

const additionalOptionData = [
  {
    image: comport2,
    name: '컴포트 II',
    description: '편의성을 위해 구성된 세트 옵션',
    price: '1,090,000',
    adoptionRate: 65,
  },
  {
    image: smartsense,
    name: '현대스마트센스 I',
    description:
      '전방 충돌 감지 / 크루즈 컨트롤 / 차로 유지 등의 ADAS 세트 옵션',
    price: '790,000',
  },
  {
    image: parking,
    name: '주차보조 시스템 Ⅱ',
    description:
      '주차 시 보행자 및 장애물과의 충돌을 예방하고 원격 주차가 가능',
    price: '1,090,000',
  },
  {
    image: sheet,
    name: '2열 통풍시트',
    description: '2열 시트에 바람이 나와 여름에 시원한 통풍이 가능',
    price: '400,000',
  },
  {
    image: sunroof,
    name: '듀얼 와이드 선루프',
    description: '넓은 개방감을 선사하는 선루프',
    price: '890,000',
  },
  {
    image: cam,
    name: '빌트인 캠(보조배터리...',
    description: '차량 내부에 카메라를 설치하여 녹화가 가능한 블랙박스',
    price: '690,000',
  },
  {
    image: mufler,
    name: '듀얼 머플러 패키지',
    description: '외관 스타일링을 위한 두 개의 머플러',
    price: '840,000',
    tag: 'H Genuine Accessories',
  },
  {
    image: air,
    name: '빌트인 공기청정기',
    description: '차량 내부 맑은 공기를 위한 공기청정기',
    price: '400,000',
    tag: 'H Genuine Accessories',
  },
  {
    image: sideStep,
    name: '사이드스텝',
    description: '높은 차고를 내려오거나 올라갈 때 도움을 주는 발판',
    price: '1,090,000',
    tag: 'H Genuine Accessories',
  },
  {
    image: knee,
    name: '적외선 무릎워머',
    description: '추운 겨울철 따뜻하게 무릎을 덥혀주는 워머',
    price: '790,000',
    tag: 'H Genuine Accessories',
  },
  {
    image: film,
    name: '차량 보호 필름',
    description: '문콕 등으로부터 차량 흠집을 방지해 주는 필름',
    price: '1,090,000',
    tag: 'H Genuine Accessories',
  },
  {
    image: production,
    name: '프로텍션 매트 패키지 I',
    description:
      '차량 트렁크와 좌석 발판을 외부 충격으로부터 보호해 주는 세트 옵션',
    price: '400,000',
    tag: 'H Genuine Accessories',
  },
  {
    image: dark20,
    name: '20인치 다크 스퍼터링 휠',
    description: '20인치의 올블랙으로 도색된 휠',
    price: '890,000',
    tag: 'N Performance',
  },
  {
    image: black20,
    name: '20인치 블랙톤 전면 가...',
    description: '20인치 블랙 계열의 고급스러운 전면 가공된 휠',
    price: '690,000',
    tag: 'N Performance',
  },
  {
    image: alcon,
    name: '알콘(alcon) 단조 브레...',
    description:
      'N 퍼포먼스의 기술력으로 만들어진 브레이크와 블랙톤 휠 세트 옵션',
    price: '840,000',
    tag: 'N Performance',
  },
];

interface AdditionalOptionProps {
  page: number;
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
  setMaxPage: React.Dispatch<React.SetStateAction<number>>;
  setTotalCount: React.Dispatch<React.SetStateAction<number>>;
}

function AdditionalOption({
  page,
  setShowOptionModal,
  setMaxPage,
  setTotalCount,
}: AdditionalOptionProps) {
  useEffect(() => {
    setMaxPage(Math.ceil(additionalOptionData.length / 8));
    setTotalCount(additionalOptionData.length);
  }, []);

  return (
    <div className='grid grid-cols-4 gap-4 max-w-5xl mx-auto'>
      {additionalOptionData.slice((page - 1) * 8, page * 8).map(item => {
        return (
          <Option
            {...item}
            key={item.name}
            setShowOptionModal={setShowOptionModal}
          />
        );
      })}
    </div>
  );
}

export default AdditionalOption;
