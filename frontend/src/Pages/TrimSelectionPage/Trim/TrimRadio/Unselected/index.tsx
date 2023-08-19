import checkCircleGrey from '@/assets/icon/trim-select-circle-grey.svg';
import { CarContext } from '@/context/CarProvider';
import { useCallback, useContext, useRef } from 'react';

export interface Props {
  carTrim: {
    name: string;
    description: string;
    basicOption: string[];
    price: number;
  };
  setWantedTrim: React.Dispatch<React.SetStateAction<string>>;
  setShowModal: (value: boolean) => void;
  optionToolTipHandler: (
    x: number | undefined,
    y: number | undefined,
    target: string,
  ) => void;
}

function Unselected({
  carTrim,
  setShowModal,
  setWantedTrim,
  optionToolTipHandler,
}: Props) {
  const showTrimChangePopup = ({
    currentTarget,
  }: React.MouseEvent<HTMLInputElement>) => {
    setWantedTrim(currentTarget.value);
    setShowModal(true);
  };
  const optionRefs = [
    useRef<HTMLButtonElement | null>(null),
    useRef<HTMLButtonElement | null>(null),
    useRef<HTMLButtonElement | null>(null),
  ];

  const optionClickHandler = useCallback(
    (e: React.MouseEvent<HTMLButtonElement>, index: number, option: string) => {
      const x = optionRefs[index].current?.getBoundingClientRect().x;
      const y = optionRefs[index].current?.getBoundingClientRect().y;
      optionToolTipHandler(x, y, option);
      e.stopPropagation();
    },
    [],
  );

  const { feature } = useContext(CarContext);

  return (
    <>
      <input
        type='radio'
        name='selectedTrim'
        id={carTrim.name}
        value={carTrim.name}
        className='hidden'
        onClick={showTrimChangePopup}
      />
      <label htmlFor={carTrim.name}>
        <div className='relative cursor-pointer'>
          <div className='flex justify-between gap-2 pt-6 mb-1'>
            <div className='flex justify-between items-center gap-2 '>
              <p className='font-body4-medium text-grey-300'>{carTrim.name}</p>
              <p className='font-caption1-regular text-grey-500'>
                {feature.engine} &middot; {feature.body} &middot;{' '}
                {feature.drivingSystem}
              </p>
            </div>

            <img src={checkCircleGrey}></img>
          </div>
          <p className='font-body3-regular text-grey-100 mb-2'>
            {carTrim.description}
          </p>
          <p className='font-h2-medium text-grey-0 mb-[14px]'>
            {carTrim.price.toLocaleString('en-US')}원
          </p>

          <div className='flex gap-3'>
            <div className='font-body4-medium text-grey-300 whitespace-nowrap'>
              기본 옵션
            </div>

            <div className='mb-6 flex flex-wrap gap-3'>
              {carTrim.basicOption.map((option, index) => (
                <button
                  ref={optionRefs[index]}
                  key={index}
                  className='gap-y-[6px] font-body4-regular text-secondary underline underline-offset-4 cursor-pointer'
                  onClick={e => optionClickHandler(e, index, option)}
                >
                  {option}
                </button>
              ))}
            </div>
          </div>
        </div>
      </label>
    </>
  );
}

export default Unselected;
