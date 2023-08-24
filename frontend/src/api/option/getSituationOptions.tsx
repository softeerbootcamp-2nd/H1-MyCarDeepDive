import { useContext } from 'react';
import useFetch, { GET } from '@/hooks/useFetch';
import { CarContext } from '@/context/CarProvider';

const TagData = [
  '대표',
  '전체',
  '주행안전',
  '사용편의',
  '추위/더위',
  '주차/출차',
  '퍼포먼스',
  '스타일',
];

export interface getSituationOptionsType {
  status: { code: string; message: string };
  data: {
    tag_img_url: string;
    options: {
      additional_option_id: number;
      option_name: string;
      option_description: string;
      option_img_url: string;
      price: number;
      position_x: number;
      position_y: number;
    }[];
  };
}

function getSituationOptions(tag: string): getSituationOptionsType | undefined {
  const { carSpec } = useContext(CarContext);
  const tagId = TagData.indexOf(tag);

  return useFetch({
    method: GET,
    url: `/options/${carSpec.id}/tags/${tagId}`,
  });
}

export default getSituationOptions;
