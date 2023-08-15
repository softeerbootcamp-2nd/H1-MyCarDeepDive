import comport2 from '@/assets/image/option-comport.png';
import smartsense from '@/assets/image/option-smartsense.png';
import parking from '@/assets/image/option-parking.png';
import sheet from '@/assets/image/option-sheet.png';
import Option from '@/Pages/OptionSelectitonPage/AdditionalOption/Option';

const optionData = [
  {
    image: comport2,
    name: '컴포트 II',
    description: '편의성을 위해 구성된 세트 옵션',
    price: '1,090,000',
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
];

interface Props {
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
}

function OptionList({ setShowOptionModal }: Props) {
  return (
    <div className='grid grid-cols-4 gap-4 max-w-5xl mx-auto'>
      {optionData.map(item => (
        <Option
          {...item}
          key={item.name}
          setShowOptionModal={setShowOptionModal}
        />
      ))}
    </div>
  );
}

export default OptionList;
