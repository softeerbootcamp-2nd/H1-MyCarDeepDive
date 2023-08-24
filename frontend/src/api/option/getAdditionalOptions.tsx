import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';
import useFetch, { GET } from '@/hooks/useFetch';

export interface getAdditionalOptionsType {
  status: { code: string; message: string };
  data: {
    optionPackageList: {
      package_option_id: number;
      option_img_url: string;
      option_select_rate: number;
      option_name: string;
      option_summary: string;
      tag_list: {
        tag_id: number;
        tag_name: string;
      }[];
      badge_name: string;
      price: number;
      additional_option_id_list: number[];
    }[];
    additionalOptionList: {
      additional_option_id: number;
      option_img_url: string;
      select_rate: number;
      option_name: string;
      option_summary: string;
      tag_list: {
        tag_id: number;
        tag_name: string;
      }[];
      badge_name: string;
      price: number;
    }[];
  };
}

function getAdditionalOptions(): getAdditionalOptionsType | undefined {
  const { carSpec } = useContext(CarContext);

  return useFetch({
    method: GET,
    url: `/car-spec/${carSpec.id}/additional-options`,
  });
}

export default getAdditionalOptions;
