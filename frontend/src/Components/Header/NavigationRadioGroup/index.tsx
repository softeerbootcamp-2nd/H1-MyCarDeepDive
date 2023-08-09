import { detailSelectionList } from '@/global/data';
import { useState } from 'react';
import NavigationRadioUnselected from './NavigationRadioUnselected';
import NavigationRadioSelected from './NavigationRadioSelected';

function NavigationRadioGroup() {
  const [property, setProperty] = useState('트림');

  const onChangeHandler = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    setProperty(target.value);
  };

  return (
    <div className='flex gap-[25px] mt-[25px]'>
      {detailSelectionList.map((data, index) => {
        const { name, value } = data;
        return (
          <div
            key={index}
            className='inline-flex gap-3 items-center justify-center'
          >
            {property === name ? (
              <NavigationRadioSelected
                name={name}
                index={index}
                value={value}
                onChangeHandler={onChangeHandler}
              />
            ) : (
              <NavigationRadioUnselected
                name={name}
                index={index}
                value={value}
                onChangeHandler={onChangeHandler}
              />
            )}
          </div>
        );
      })}
    </div>
  );
}

export default NavigationRadioGroup;
