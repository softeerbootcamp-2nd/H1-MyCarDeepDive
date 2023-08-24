import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';
import useFetch, { GET } from '@/hooks/useFetch';

export interface initialColorType {
  color_id: number;
  trim_id: number;
  trim_name: string;
  name: string;
  img_url: string;
  car_img_urls: string[];
  price: number;
  choose_rate: number;
}

export interface getInitialColorType {
  status: { code: string; message: string };
  data: {
    exterior_color_response: {
      available_colors: initialColorType[];
      unavailable_colors: initialColorType[];
      other_trim_colors: initialColorType[];
    };
    interior_color_response: {
      available_colors: initialColorType[];
      unavailable_colors: initialColorType[];
      other_trim_colors: initialColorType[];
    };
  };
}

function getAllColor(): getInitialColorType | undefined {
  const { carSpec } = useContext(CarContext);

  return useFetch({
    method: GET,
    url: `/color/trim-colors?trimId=${carSpec.trim.id}`,
    showLoading: false,
  });
}

export default getAllColor;
