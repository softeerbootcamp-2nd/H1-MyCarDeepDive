import toolTip from '@/assets/icon/tool-tip.svg';
import toolTipSharp from '@/assets/icon/tool-tip-sharp.svg';
import { useEffect } from 'react';

interface toolTipDataType {
  [key: string]: string;
}

const toolTipData: toolTipDataType = {
  engine: '디젤은 연비가 좋고 가솔린은 승차감이 더 부드럽고 조용해요.',
  body: '7인승의 경우 2열의 가운데에 시트가 없어 통행이 편하고 8인승의 경우 2열 가운데에 시트가 존재해요.',
  operation:
    '2WD는 두개의 모터로 구성되어 가볍고 효율이 좋고 4WD는 네개의 모터로 구성되어 주행 안정성이 높아요.',
  trim: '트림은 등급이에요. 등급이 올라갈수록 기본 포함 옵션들이 점점 추가되고 내부 시트의 퀄리티가 높아져요.',
};

interface ToolTipProps {
  toolTipInfo: {
    x: number;
    y: number;
    name: string;
  };
  showToolTip: boolean;
  setShowToolTip: React.Dispatch<React.SetStateAction<boolean>>;
}

function ToolTip({ toolTipInfo, showToolTip, setShowToolTip }: ToolTipProps) {
  useEffect(() => {
    const handleScroll = () => {
      setShowToolTip(false);
    };

    window.addEventListener('scroll', handleScroll);

    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, []);

  if (!showToolTip) return null;
  return (
    <div
      className='transform z-50'
      style={{
        position: 'fixed',
        top: toolTipInfo.y,
        left: toolTipInfo.x,
        transform: `translateY(-${toolTipInfo.name === 'engine' ? 74 : 96}px)`,
      }}
    >
      <div className='z-50 w-80 bg-[#2E3D51] font-body4-regular text-grey-900 py-3 px-3.5 flex gap-2.5 rounded-lg'>
        <img src={toolTip} alt='toolTip' />
        <div>{toolTipData[toolTipInfo.name]}</div>
      </div>
      <img src={toolTipSharp} alt='toolTipSharp' />
    </div>
  );
}

export default ToolTip;
