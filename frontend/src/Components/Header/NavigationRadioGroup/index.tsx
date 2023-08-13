import { detailSelectionList } from '@/global/data';
import { useEffect, useState } from 'react';
import NavigationRadioUnselected from './NavigationRadioUnselected';
import NavigationRadioSelected from './NavigationRadioSelected';

function NavigationRadioGroup() {
  const [property, setProperty] = useState('');

  useEffect(() => {
    const path = location.pathname;
    if (path === '/select/trim') {
      setProperty('트림');
    } else if (path === '/select/color') {
      setProperty('색상');
    } else if (path === '/select/option') {
      setProperty('옵션');
    } else {
      setProperty('');
    }
  }, [location.pathname]);

  const onChangeHandler = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    setProperty(target.value);
  };

  return (
    <div className='flex gap-[25px] mt-[25px]'>
      {detailSelectionList.map((data, index) => {
        const { name, value, address } = data;
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
                address={address}
              />
            )}
          </div>
        );
      })}
    </div>
  );
}

export default NavigationRadioGroup;
