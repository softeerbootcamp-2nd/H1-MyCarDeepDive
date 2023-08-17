import { useEffect, useState, MouseEvent } from 'react';
import roundedIcon from '@/assets/icon/rounded.svg';
import useFetch, { GET } from '@/hooks/useFetch';
interface CarRotationProps {
  rotation: boolean;
}
function CarRotation({ rotation }: CarRotationProps) {
  const [appear, setAppear] = useState(false);
  const [isAnimate, setIsAnimate] = useState(false);
  const [carList, setCarList] = useState<{ path: string }[]>([]);
  const [focus, setFocus] = useState<number>(10);
  const [isClicked, setIsClicked] = useState<boolean>(false);
  const [pointerPosition, setPointerPosition] = useState<number>(
    window.innerWidth / 2,
  );
  // useEffect(() => {
  //   let newCarList = [] as { path: string }[];
  //   for (let idx = 1; idx <= 60; idx++) {
  //     const num = idx < 10 ? '00' + idx : '0' + idx;
  //     const path = `/palisade/abyss/image_${num}.png`;
  //     newCarList = [...newCarList, { path }];
  //   }
  //   setCarList(newCarList);
  // }, []);
  const data = useFetch<any>({
    method: GET,
    url: '/color/exterior-colors?trimId=1&interiorColorId=1',
  });
  useEffect(() => {
    if (data === undefined) return;
    console.log(data?.data.other_trim_colors[0].car_img_urls);
    let newCarList = [] as { path: string }[];
    for (let idx = 0; idx < 60; idx++) {
      const path =
        'https://img.make-my-car.shop' +
        data?.data.other_trim_colors[0].car_img_urls[idx]
          .replace('A2B/', 'A2B/image_')
          .replace('jpg', 'png');
      newCarList = [...newCarList, { path }];
    }
    setCarList(newCarList);
  }, [data]);
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
    setAppear(true);
  }, [setAppear]);
  return (
    <div
      className={`w-full z-40 relative transition-transform duration-1000 ease-out ${
        appear ? 'translate-x-0' : 'translate-x-[100%]'
      }`}
      onMouseDown={onMouseDownHandler}
      onMouseMove={onMouseMoveHandler}
      onMouseUp={onMouseOverHandler}
      onMouseLeave={onMouseLeaveHandler}
    >
      {carList.map((it, idx) => (
        <img
          className='w-[85%] z-10 ml-32'
          key={idx}
          src={it.path}
          style={
            focus === idx ? { display: 'inline-block' } : { display: 'none' }
          }
          draggable={false}
        />
      ))}
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
