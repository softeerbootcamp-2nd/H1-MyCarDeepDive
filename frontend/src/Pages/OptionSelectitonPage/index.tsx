import { useState } from 'react';
import Tab from './Tab';
import Tag from './Tag';
import AllCount from './AllCount';
import AdditionalOption from './AdditionalOption';
import Pagination from './Pagination';
import BottomButtons from './BottomButtons';
import OptionModal from './OptionModal';

import comport from '@/assets/image/option-modal-comport.png';
import metalStep from '@/assets/image/option-modal-metalStep.png';
import metalDoor from '@/assets/image/option-modal-metalDoor.png';
import powerFolding from '@/assets/image/option-modal-powerFolding.png';
import hotSheet from '@/assets/image/option-modal-hotSheet.png';
import headUp from '@/assets/image/option-modal-headUp.png';

const OptionCardData = [
  {
    tag: ['#사용편의', '#주행안전', '#추위/더위'],
    image: comport,
    optionName: '컴포트 II',
    detailOptionName: '후석 승객 알림',
    price: '1,090,000',
    description:
      '초음파 센서를 통해 뒷좌석에 남아있는 승객의 움직임을 감지하여 운전자에게 경고함으로써 부주의에 의한 유아 또는 반려 동물 등의 방치 사고를 예방하는 신기술입니다.',
    detailOptions: [
      '후석 승객 알림',
      '메탈 리어범퍼스텝',
      '메탈 도어스커프',
      '3열 파워폴딩시트',
      '3열 열선시트',
      '헤드업 디스플레이',
    ],
  },
  {
    tag: ['#사용편의', '#주행안전', '#추위/더위'],
    image: metalStep,
    optionName: '컴포트 II',
    detailOptionName: '메탈 리어범퍼스텝',
    price: '1,090,000',
    description:
      '러기지 룸 앞쪽 하단부를 메탈로 만들어 물건을 싣고 내릴 때나 사람이 올라갈 때 차체를 보호해줍니다.',
    detailOptions: [
      '후석 승객 알림',
      '메탈 리어범퍼스텝',
      '메탈 도어스커프',
      '3열 파워폴딩시트',
      '3열 열선시트',
      '헤드업 디스플레이',
    ],
  },
  {
    tag: ['#사용편의', '#주행안전', '#추위/더위'],
    image: metalDoor,
    optionName: '컴포트 II',
    detailOptionName: '메탈 도어스커프',
    price: '1,090,000',
    description:
      '자동차를 타고 내리는 도어의 문틈 하부를 보호하는 도어스커프 부분을 메탈로 만들어 차체를 보호하고 메탈 디자인으로 고급스러운 감성을 전달합니다.',
    detailOptions: [
      '후석 승객 알림',
      '메탈 리어범퍼스텝',
      '메탈 도어스커프',
      '3열 파워폴딩시트',
      '3열 열선시트',
      '헤드업 디스플레이',
    ],
  },

  {
    tag: ['#사용편의', '#주행안전', '#추위/더위'],
    image: powerFolding,
    optionName: '컴포트 II',
    detailOptionName: '3열 파워폴딩시트',
    price: '1,090,000',
    description:
      '러기지 사이드에 있는 버튼으로 3열 시트를 접었다 펼 수 있으며, 2열 시트도 조작할 수 있어 화물 적재시나 3열 이용시 사용자의 편의성을 높였습니다.',
    detailOptions: [
      '후석 승객 알림',
      '메탈 리어범퍼스텝',
      '메탈 도어스커프',
      '3열 파워폴딩시트',
      '3열 열선시트',
      '헤드업 디스플레이',
    ],
  },
  {
    tag: ['#사용편의', '#주행안전', '#추위/더위'],
    image: hotSheet,
    optionName: '컴포트 II',
    detailOptionName: '3열 열선시트',
    price: '1,090,000',
    description:
      '시동이 걸린 상태에서 해당 좌석 히터 스위치를 누르면 강약조절 표시등이 켜져 사용 중임을 나타내고 해당 좌석이 따뜻해집니다.',
    detailOptions: [
      '후석 승객 알림',
      '메탈 리어범퍼스텝',
      '메탈 도어스커프',
      '3열 파워폴딩시트',
      '3열 열선시트',
      '헤드업 디스플레이',
    ],
  },
  {
    tag: ['#사용편의', '#주행안전', '#추위/더위'],
    image: headUp,
    optionName: '컴포트 II',
    detailOptionName: '헤드업 디스플레이',
    price: '1,090,000',
    description:
      '주요 주행 정보를 전면 윈드실드에 표시하며, 밝기가 최적화되어 주간에도 시인성이 뛰어납니다.',
    detailOptions: [
      '후석 승객 알림',
      '메탈 리어범퍼스텝',
      '메탈 도어스커프',
      '3열 파워폴딩시트',
      '3열 열선시트',
      '헤드업 디스플레이',
    ],
  },
];

function OptionSelectitonPage() {
  const [offsetX, setOffsetX] = useState(0);
  const [category, setCategory] = useState('추가 옵션');
  const [tag, setTag] = useState('전체');
  const [page, setPage] = useState(1);
  const [showOptionModal, setShowOptionModal] = useState(false);

  const categoryClickHandler = (
    e: React.MouseEvent<HTMLButtonElement, MouseEvent>,
  ) => {
    setCategory(e.currentTarget.innerText);
    setOffsetX(e.currentTarget.offsetLeft);
  };

  return (
    <div className='mt-[120px]'>
      <Tab
        category={category}
        offsetX={offsetX}
        categoryClickHandler={categoryClickHandler}
      />
      <Tag tag={tag} setTag={setTag} />
      <AllCount />
      <AdditionalOption page={page} setShowOptionModal={setShowOptionModal} />
      <Pagination page={page} setPage={setPage} />
      <BottomButtons />

      <OptionModal
        showOptionModal={showOptionModal}
        setShowOptionModal={setShowOptionModal}
        OptionCardData={OptionCardData}
      />
    </div>
  );
}

export default OptionSelectitonPage;
