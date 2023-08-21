import { useContext, useRef } from 'react';
import { carFeatureList } from '@/global/data';
import Selected from './Selected';
import Unselected from './Unselected';
import { CarContext } from '@/context/CarProvider';
import {
  SET_BODY,
  SET_DRIVINGSYSTEM,
  SET_ENGINE,
} from '@/context/CarProvider/type';

interface Props {
  toolTipHandler: (
    x: number | undefined,
    y: number | undefined,
    target: string,
  ) => void;
  setShowToolTip: React.Dispatch<React.SetStateAction<boolean>>;
}

function FeatureRadio({ toolTipHandler, setShowToolTip }: Props) {
  const { carDispatch, carSpec } = useContext(CarContext);

  const engineHandler = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    carDispatch({ type: SET_ENGINE, engine: target.value });
  };
  const bodyHandler = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    carDispatch({ type: SET_BODY, body: target.value });
  };
  const drivingSystemHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    carDispatch({ type: SET_DRIVINGSYSTEM, drivingSystem: target.value });
  };
  const handlerMap: Record<
    string,
    (e: React.ChangeEvent<HTMLInputElement>) => void
  > = {
    engine: engineHandler,
    body: bodyHandler,
    drivingSystem: drivingSystemHandler,
  };

  const refs = [
    useRef<HTMLParagraphElement | null>(null),
    useRef<HTMLParagraphElement | null>(null),
    useRef<HTMLParagraphElement | null>(null),
  ];

  const hoverHandler = (index: number, name: string) => {
    const x: number | undefined =
      refs[index].current?.getBoundingClientRect().x;
    const y: number | undefined =
      refs[index].current?.getBoundingClientRect().y;

    toolTipHandler(x, y, name);
  };

  return (
    <>
      {carFeatureList.map((carFeature, index) => {
        const { type, description, valueList } = carFeature;
        const selectedValue =
          carSpec.feature[type as keyof typeof carSpec.feature];

        return (
          <div
            key={index}
            onMouseEnter={() => hoverHandler(index, type)}
            onMouseLeave={() => setShowToolTip(false)}
          >
            <p
              className='font-body4-medium mb-1 text-grey-200'
              ref={refs[index]}
            >
              {description}
            </p>
            <div className='flex justify-center items-center'>
              {valueList.map((value, index) =>
                selectedValue === value ? (
                  <Selected
                    key={index}
                    name={type}
                    value={value}
                    onChangeHandler={handlerMap[type]}
                  />
                ) : (
                  <Unselected
                    key={index}
                    name={type}
                    value={value}
                    onChangeHandler={handlerMap[type]}
                  />
                ),
              )}
            </div>
          </div>
        );
      })}
    </>
  );
}

export default FeatureRadio;
