import { useParams } from 'react-router-dom';
import useFetch, { GET } from '@/hooks/useFetch';

export interface myCarResultDataType {
  car_name: string;
  engine_name: string;
  driving_system_name: string;
  trim_name: string;
  body_name: string;
  exterior_color_name: string;
  exterior_color_img_url: string;
  exterior_color_price: number;
  interior_color_name: string;
  interior_color_img_url: string;
  interior_color_price: number;
  option_list: {
    option_name: string;
    option_price: number;
    option_img_url: string;
  }[];
  basic_price: number;
  pdf_url: string;
  total_price: number;
}

export interface getMyCarResultType {
  status: { code: string; message: string };
  data: myCarResultDataType;
}

function getMyCarResult(): getMyCarResultType | undefined {
  const { id } = useParams();

  return useFetch({
    method: GET,
    url: `/pdf/${id}/car-information`,
    showLoading: true,
  });
}

export default getMyCarResult;
