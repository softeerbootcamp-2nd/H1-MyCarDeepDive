import checkCircleBlue from '@/assets/icon/check-circle-lifecycle-blue.svg';
import { CarContext } from '@/context/CarProvider';
import { useCallback, useContext, useRef } from 'react';

export interface Props {
  carSpecData: {
    car_spec_id: number;
    trim_id: number;
    trim_name: string;
    price: number;
    summary: string;
    basic_option_ids: number[];
    basic_option_names: string[];
  };
  optionToolTipHandler: (
    x: number | undefined,
    y: number | undefined,
    target: string,
  ) => void;
}

function Selected({ carSpecData, optionToolTipHandler }: Props) {
  const optionRefs = [
    useRef<HTMLButtonElement | null>(null),
    useRef<HTMLButtonElement | null>(null),
    useRef<HTMLButtonElement | null>(null),
  ];
  const optionClickHandler = useCallback((index: number, option: string) => {
    const x = optionRefs[index].current?.getBoundingClientRect().x;
    const y = optionRefs[index].current?.getBoundingClientRect().y;
    optionToolTipHandler(x, y, option);
  }, []);

  const { carSpec } = useContext(CarContext);
  return (
    <>
      <input
        type='radio'
        name='carSpec'
        id={carSpecData.trim_name}
        value={carSpecData.trim_name}
        className='hidden'
      />
      <label htmlFor={carSpecData.trim_name}>
        <div className='relative'>
          <div className='flex justify-between pt-6 mb-1'>
            <div className='flex justify-between items-center gap-2 '>
              <p className='font-body4-medium text-grey-300'>
                {carSpecData.trim_name}
              </p>
              <p className='font-caption1-regular text-grey-500'>
                {carSpec.feature.engine} &middot; {carSpec.feature.body}{' '}
                &middot; {carSpec.feature.drivingSystem}
              </p>
            </div>

            <img src={checkCircleBlue}></img>
          </div>
          <p className='font-body3-regular text-grey-100 mb-2'>
            {carSpecData.summary}
          </p>
          <p className='font-h2-medium text-grey-0 mb-[14px]'>
            {carSpecData.price.toLocaleString('en-US')}원
          </p>

          <div className='flex gap-3'>
            <div className='font-body4-medium text-grey-300 whitespace-nowrap'>
              기본 옵션
            </div>

            <div className='mb-6 flex flex-wrap gap-3'>
              {carSpecData.basic_option_names.map((option, index) => (
                <button
                  ref={optionRefs[index]}
                  key={index}
                  className='gap-y-[6px] font-body4-regular text-secondary underline underline-offset-4 cursor-pointer'
                  onClick={() => optionClickHandler(index, option)}
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

export default Selected;