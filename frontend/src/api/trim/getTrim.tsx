import { useContext, useEffect, useState } from 'react';
import { CarContext } from '@/context/CarProvider';
import useFetch, { GET } from '@/hooks/useFetch';

export interface getTrimType {
  status: { code: string; message: string };
  data: {
    car_specs: {
      car_spec_id: number;
      trim_id: number;
      trim_name: string;
      price: number;
      summary: string;
      basic_option_ids: number[];
      basic_option_names: string[];
    }[];
    recommend_trim_id: number;
  };
}

function getTrim(): getTrimType | undefined {
  const { carSpec } = useContext(CarContext);
  const [engineId, setEngineId] = useState('1');
  const [bodyId, setBodyId] = useState('1');
  const [drivingSystemId, setDrivingSystemId] = useState('1');

  useEffect(() => {
    setEngineId(carSpec.feature.engine === '디젤 2.2' ? '1' : '2');
    setBodyId(carSpec.feature.body === '7인승' ? '1' : '2');
    setDrivingSystemId(carSpec.feature.drivingSystem === '2WD' ? '1' : '2');
  }, [carSpec.feature]);

  return useFetch({
    method: GET,
    url: `/car-spec?engineId=${engineId}&bodyId=${bodyId}&drivingSystemId=${drivingSystemId}`,
    showLoading: true,
  });
}

export default getTrim;
