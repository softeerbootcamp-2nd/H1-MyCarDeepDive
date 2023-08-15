import { useEffect } from 'react';
import Option from './Option';
import cluster from '@/assets/image/basic-option-cluster.png';
import door from '@/assets/image/basic-option-door.png';
import system from '@/assets/image/basic-option-system.png';
import smartphone from '@/assets/image/basic-option-smartphone.png';
import tilt from '@/assets/image/basic-option-tilt.png';
import smartpower from '@/assets/image/basic-option-smartpower.png';
import balsu from '@/assets/image/basic-option-balsu.png';
import monitor from '@/assets/image/basic-option-monitor.png';

const BasicOptionData = [
  {
    image: cluster,
    name: '클러스터(12.3인치 컬러 LCD)',
  },
  {
    image: door,
    name: '인조가죽 감싸기 & 도어 암레스트 리얼스티치',
  },
  {
    image: system,
    name: '운전석 자세 메모리 시스템 발수 도어(1열)',
  },
  {
    image: smartphone,
    name: '스마트폰 무선충전 후측방 모니터',
  },
  {
    image: tilt,
    name: '전동식 틸트 & 텔레스코픽 스티어링 휠',
  },
  {
    image: smartpower,
    name: '스마트 파워 테일게이트',
  },
  {
    image: balsu,
    name: '발수 도어(1열)',
  },
  {
    image: monitor,
    name: '스마트폰 무선충전 후측방 모니터2',
  },
];

interface BasicOptionProps {
  page: number;
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
  setMaxPage: React.Dispatch<React.SetStateAction<number>>;
  setTotalCount: React.Dispatch<React.SetStateAction<number>>;
}

function BasicOption({
  page,
  setShowOptionModal,
  setMaxPage,
  setTotalCount,
}: BasicOptionProps) {
  useEffect(() => {
    setMaxPage(Math.ceil(BasicOptionData.length / 12));
    setTotalCount(BasicOptionData.length);
  }, []);

  return (
    <div className='grid grid-cols-4 gap-4 max-w-5xl mx-auto'>
      {BasicOptionData.slice((page - 1) * 12, page * 12).map((item, idx) => {
        return (
          <Option {...item} key={idx} setShowOptionModal={setShowOptionModal} />
        );
      })}
    </div>
  );
}

export default BasicOption;
