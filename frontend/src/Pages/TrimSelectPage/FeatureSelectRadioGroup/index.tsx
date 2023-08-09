import { carFeatureList } from '@/global/data';
import { Fragment } from 'react';
import FeatureSelectRadioSelected from './FeatureSelectRadioSelected';
import FeatureSelectRadioUnselected from './FeatureSelectRadioUnselected';
import { FeatureSelectRadioGroupProps } from '@/global/type';

function FeatureSelectRadioGroup({
  carFeature,
  onChangeHandler,
}: FeatureSelectRadioGroupProps) {
  return (
    <>
      {carFeatureList.map((feature, index) => {
        const { name, description, valueList } = feature;
        const radioValue = carFeature[feature.name as keyof typeof carFeature];
        return (
          <Fragment key={index}>
            <p className='font-body4-medium mb-1 text-grey-200'>
              {description}
            </p>
            <div className='flex justify-center items-center'>
              {valueList.map((value, index) =>
                radioValue === value ? (
                  <FeatureSelectRadioSelected
                    key={index}
                    name={name}
                    value={value}
                    onChangeHandler={onChangeHandler}
                  />
                ) : (
                  <FeatureSelectRadioUnselected
                    key={index}
                    name={name}
                    value={value}
                    onChangeHandler={onChangeHandler}
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
