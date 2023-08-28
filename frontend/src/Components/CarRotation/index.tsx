import { useEffect, useState, MouseEvent } from 'react';
import roundedIcon from '@/assets/icon/rounded.svg';
import usePrevious from '@/hooks/usePrevious';

interface CarRotationProps {
  rotation: boolean;
  carImageUrl: string[];
}

function CarRotation({ rotation, carImageUrl }: CarRotationProps) {
  const prevImageUrl = usePrevious(carImageUrl);
  const [appear, setAppear] = useState(false);
  const [isAnimate, setIsAnimate] = useState(false);
  const [focus, setFocus] = useState<number>(10);
  const [isClicked, setIsClicked] = useState<boolean>(false);
  const [pointerPosition, setPointerPosition] = useState<number>(
    window.innerWidth / 2,
  );
  const [timer, setTimer] = useState<NodeJS.Timeout | undefined>(undefined);

  const onMouseDownHandler = (e: MouseEvent<HTMLDivElement>) => {
    if (!rotation) return;

    setIsClicked(true);
    setPointerPosition(e.screenX);
  };

  const onMouseOverHandler = () => {
    if (!rotation) return;

    setIsClicked(false);
  };

  const onMouseMoveHandler = (e: MouseEvent<HTMLDivElement>) => {
    if (!rotation) return;

    if (isClicked && pointerPosition > e.screenX + 5) {
      setFocus((focus + 1) % 60);
      setPointerPosition(e.screenX);
    } else if (isClicked && pointerPosition < e.screenX - 5) {
      focus - 1 < 0 ? setFocus(59) : setFocus(focus - 1);
      setPointerPosition(e.screenX);
    }
  };

  const onMouseLeaveHandler = () => {
    setIsClicked(false);
  };

  useEffect(() => {
    if (!isAnimate) return;

    if (!rotation) {
      if (focus === 10) return setIsAnimate(false);

      setTimeout(() => {
        setFocus(focus => (focus + 1) % 60);
      }, 25);
    } else {
      if (focus === 0) return setIsAnimate(false);

      setTimeout(() => {
        setFocus(focus => (focus - 1) % 60);
      }, 25);
    }
  }, [focus, isAnimate, rotation]);

  useEffect(() => {
    setIsAnimate(true);
  }, [rotation, setIsAnimate]);

  useEffect(() => {
    if (prevImageUrl && prevImageUrl[0] === carImageUrl[0]) return;
    if (timer) {
      clearTimeout(timer);
      setTimer(undefined);
    }
    setAppear(false);

    setTimeout(() => {
      setAppear(true);
    }, 500);
  }, [setAppear, carImageUrl]);

  return (
    <div
      className={`w-full z-40 relative ${
        appear
          ? 'translate-x-0 transition-transform duration-1000 ease-out'
          : 'translate-x-[200%]'
      }`}
      onMouseDown={onMouseDownHandler}
      onMouseMove={onMouseMoveHandler}
      onMouseUp={onMouseOverHandler}
      onMouseLeave={onMouseLeaveHandler}
    >
      {carImageUrl.length > 1
        ? carImageUrl.map((image, idx) => (
            <img
              className='w-[85%] z-10 ml-32'
              key={idx}
              src={`https://${image}`}
              style={
                focus === idx
                  ? { display: 'inline-block' }
                  : { display: 'none' }
              }
              draggable={false}
            />
          ))
        : carImageUrl[0] && (
            <img
              className='w-[85%] z-10 ml-32'
              src={`https://${carImageUrl[0]}`}
              draggable={false}
            />
          )}
      <div
        className={`w-[85%] h-24 ml-32 absolute top-[59%] left-0 -z-10 transition-opacity duration-1000 ${
          rotation ? 'opacity-100' : 'opacity-0'
        }`}
      >
        <img src={roundedIcon} alt='roundedIcon' className='w-full' />
      </div>
    </div>
  );
}

export default CarRotation;
