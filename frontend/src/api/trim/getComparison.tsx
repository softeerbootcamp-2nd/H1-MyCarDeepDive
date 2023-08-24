import { useContext, useEffect, useState } from 'react';
import { CarContext } from '@/context/CarProvider';
import useFetch, { GET } from '@/hooks/useFetch';

export interface getComparisonType {
  status: { code: string; message: string };
  data: {
    trims_img_url: string;
    summary: string;
    trim_name: string;
    price: number;
    exterior_color_img_urls: string[];
    interior_color_names: string[];
    wheel_size: number;
    wheel_name: string;
    seat_name: string;
    navigation_size: number;
    cluster_size: number;
    basic_option_names: string[];
    basic_option_ids: number[];
  }[];
}

function getComparison(): getComparisonType | undefined {
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
    url: `/car-spec/comparison?engineId=${engineId}&bodyId=${bodyId}&drivingSystemId=${drivingSystemId}`,
  });
}

export default getComparison;
