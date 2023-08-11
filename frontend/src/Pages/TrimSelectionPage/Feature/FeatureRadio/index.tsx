import { useRef } from 'react';
import { carFeatureList } from '@/global/data';
import { FeatureSelectRadioGroupProps } from '@/global/type';
import Selected from './Selected';
import Unselected from './Unselected';

interface Props extends FeatureSelectRadioGroupProps {
  toolTipHandler: (
    x: number | undefined,
    y: number | undefined,
    target: string,
  ) => void;
  setShowToolTip: React.Dispatch<React.SetStateAction<boolean>>;
}

function FeatureRadio({
  carFeature,
  mycarFeatureHandler,
  toolTipHandler,
  setShowToolTip,
}: Props) {
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
      {carFeatureList.map((feature, index) => {
        const { name, description, valueList } = feature;
        const radioValue = carFeature[feature.name as keyof typeof carFeature];

        return (
          <div
            key={index}
            onMouseEnter={() => hoverHandler(index, name)}
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
                radioValue === value ? (
                  <Selected
                    key={index}
                    name={name}
                    value={value}
                    onChangeHandler={mycarFeatureHandler}
                  />
                ) : (
                  <Unselected
                    key={index}
                    name={name}
                    value={value}
                    onChangeHandler={mycarFeatureHandler}
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
