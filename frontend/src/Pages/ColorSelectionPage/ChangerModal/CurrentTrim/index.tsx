import { useContext } from 'react';
import TrimInfo from '../TrimInfo';
import { CarContext } from '@/context/CarProvider';

function CurrentTrim() {
  const { carSpec } = useContext(CarContext);
  return (
    <TrimInfo
      title='현재 트림'
      trimName={carSpec.trim.name}
      trimPrice={carSpec.price}
    />
  );
}

export default CurrentTrim;
