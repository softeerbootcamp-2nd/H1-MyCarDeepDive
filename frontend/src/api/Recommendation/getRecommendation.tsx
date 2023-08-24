import { useContext } from 'react';
import useFetch, { GET } from '@/hooks/useFetch';
import { QuestionContext } from '@/context/QuestionProvider';
import { ageQuestionList } from '@/global/data';

export interface recommendType {
  trim_name: string;
  trim_price: number;
  car_img_url: string;
  comment1: string;
  comment2: string;
  keyword: string;
  engine_name: string;
  driving_system_name: string;
  body_name: string;
  car_spec_id: number;
  trim_id: number;
  exterior_color: {
    color_id: number;
    color_name: string;
    color_price: number;
    color_comment: string;
    color_icon_url: string;
  };
  interior_color: {
    color_id: number;
    color_name: string;
    color_price: number;
    color_comment: string;
    color_icon_url: string;
  };
  options: {
    option_id: number;
    option_name: string;
    option_img_url: string;
    option_price: number;
    option_comment: string;
  }[];
  packages: {
    option_id: number;
    option_name: string;
    option_img_url: string;
    option_price: number;
    option_comment: string;
  }[];
  total_price: number;
}

export interface getRecommendationType {
  status: { code: string; message: string };
  data: recommendType;
}

function getRecommendation(): getRecommendationType | undefined {
  const { age, lifeStyle } = useContext(QuestionContext);

  if (lifeStyle === '') return undefined;
  return useFetch({
    method: GET,
    url: `/car-recommendation?ageGroupId=${
      ageQuestionList.indexOf(age) + 1
    }&lifeStyleId=${lifeStyle}`,
    showLoading: true,
  });
}

export default getRecommendation;
