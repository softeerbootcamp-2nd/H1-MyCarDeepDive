import { useCallback, useContext, useRef } from 'react';
import { priceToString } from '@/utils';
import checkCircleGrey from '@/assets/icon/trim-select-circle-grey.svg';
import { CarContext } from '@/context/CarProvider';
import useLogFetch from '@/hooks/useLogFetch';

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
  wantedTrimHandler: (e: React.MouseEvent<HTMLInputElement>) => void;
  setShowModal: (value: boolean) => void;
  optionToolTipHandler: (
    x: number | undefined,
    y: number | undefined,
    target: string,
  ) => void;
}

function Unselected({
  carSpecData,
  wantedTrimHandler,
  optionToolTipHandler,
}: Props) {
  const optionRefs = [
    useRef<HTMLButtonElement | null>(null),
    useRef<HTMLButtonElement | null>(null),
    useRef<HTMLButtonElement | null>(null),
  ];

  const optionClickHandler = useCallback(
    (
      e: React.MouseEvent<HTMLButtonElement>,
      index: number,
      optionId: number,
    ) => {
      const x = optionRefs[index].current?.getBoundingClientRect().x;
      const y = optionRefs[index].current?.getBoundingClientRect().y;
      optionToolTipHandler(x, y, optionId);
      e.stopPropagation();
    },
    [],
  );

  const { carSpec } = useContext(CarContext);
  const myCarSpecData = {
    carSpecId: carSpecData.car_spec_id,
    trimId: carSpecData.trim_id,
    trimName: carSpecData.trim_name,
    price: carSpecData.price,
  };

  return (
    <>
      <input
        type='radio'
        id={carSpecData.trim_name}
        name='carSpec'
        value={carSpecData.trim_name}
        className='hidden'
        onClick={e => {
          useLogFetch({
            url: `/car-spec/activity-log/${carSpecData.car_spec_id}`,
          });
          wantedTrimHandler(e);
        }}
        data-object={JSON.stringify(myCarSpecData)}
      />
      <label htmlFor={carSpecData.trim_name}>
        <div className='relative cursor-pointer'>
          <div className='flex justify-between gap-2 pt-6 mb-1'>
            <div className='flex justify-between items-center gap-2 '>
              <p className='font-body4-medium text-grey-300'>
                {carSpecData.trim_name}
              </p>
              <p className='font-caption1-regular text-grey-500'>
                {carSpec.feature.engine} &middot; {carSpec.feature.body}{' '}
                &middot; {carSpec.feature.drivingSystem}
              </p>
            </div>

            <img src={checkCircleGrey}></img>
          </div>
          <p className='font-body3-regular text-grey-100 mb-2'>
            {carSpecData.summary}
          </p>
          <p className='font-h2-medium text-grey-0 mb-[14px]'>
            {priceToString(carSpecData.price)}원
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
                  onClick={e =>
                    optionClickHandler(
                      e,
                      index,
                      carSpecData.basic_option_ids[index],
                    )
                  }
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
