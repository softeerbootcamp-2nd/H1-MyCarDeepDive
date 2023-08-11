import { WrapperProps } from '@/global/type';
import { useRef } from 'react';

interface TrimWrapperProps extends WrapperProps {
  toolTipHandler: (
    x: number | undefined,
    y: number | undefined,
    target: string,
  ) => void;
  setShowToolTip: React.Dispatch<React.SetStateAction<boolean>>;
}

function TrimWrapper({
  children,
  toolTipHandler,
  setShowToolTip,
}: TrimWrapperProps) {
  const trimRef = useRef<HTMLDivElement | null>(null);

  const hoverHandler = () => {
    const x: number | undefined = trimRef.current?.getBoundingClientRect().x;
    const y: number | undefined = trimRef.current?.getBoundingClientRect().y;

    toolTipHandler(x, y, 'trim');
  };

  return (
    <div
      ref={trimRef}
      className='mt-8'
      onMouseEnter={() => hoverHandler()}
      onMouseLeave={() => setShowToolTip(false)}
    >
      {children}
    </div>
  );
}

export default TrimWrapper;
