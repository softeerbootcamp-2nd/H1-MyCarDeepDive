import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';
import useFetch, { GET } from '@/hooks/useFetch';

export interface getBasicOptionsType {
  status: { code: string; message: string };
  data: {
    basic_option_id: number;
    option_img_url: string;
    option_name: string;
    tag_list: {
      tag_id: number;
      tag_name: string;
    }[];
  }[];
}

function getBasicOptions(): getBasicOptionsType | undefined {
  const { carSpec } = useContext(CarContext);

  return useFetch({
    method: GET,
    url: `/car-spec/${carSpec.id}/basic-options`,
    showLoading: false,
  });
}

export default getBasicOptions;
