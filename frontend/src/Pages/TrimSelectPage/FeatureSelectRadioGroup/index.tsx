import { carFeatureList } from '@/global/data';
import { Fragment, useState } from 'react';
import FeatureSelectRadioSelected from './FeatureSelectRadioSelected';
import FeatureSelectRadioUnselected from './FeatureSelectRadioUnselected';

function FeatureSelectRadioGroup() {
  const [carFeature, setCarFeature] = useState({
    engine: '디젤 2.2',
    body: '7인승',
    operation: '2WD',
  });

  const mycarFeatureHandler = ({
    target,
  }: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = target;
    setCarFeature({ ...carFeature, [name]: value });
  };

  return (
    <>
      {carFeatureList.map((feature, index) => {
        const { name, description, valueList } = feature;
        const radioValue = carFeature[feature.name as keyof typeof carFeature];
        return (
          <Fragment key={index}>
            <div className='font-body4-medium mb-1 text-grey-200'>
              {description}
            </div>
            <div className='flex justify-center items-center'>
              {valueList.map((value, index) =>
                radioValue === value ? (
                  <FeatureSelectRadioSelected
                    key={index}
                    name={name}
                    value={value}
                    onChangeHandler={mycarFeatureHandler}
                  />
                ) : (
                  <FeatureSelectRadioUnselected
                    key={index}
                    name={name}
                    value={value}
                    onChangeHandler={mycarFeatureHandler}
                  />
                ),
              )}
            </div>
          </Fragment>
        );
      })}
    </>
  );
}

export default FeatureSelectRadioGroup;
