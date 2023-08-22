import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';
import useFetch, { GET } from '@/hooks/useFetch';
import { ColorType } from '@/global/type';

export interface getExteriorColorType {
  status: { code: string; message: string };
  data: {
    available_colors: ColorType[];
    unavailable_colors: ColorType[];
    other_trim_colors: ColorType[];
  };
}

function getExteriorColor(): getExteriorColorType | undefined {
  const { carSpec, color } = useContext(CarContext);

  return useFetch({
    method: GET,
    url: `/color/exterior-colors?trimId=${carSpec.trim.id}&interiorColorId=${color.interiorColor.id}`,
  });
}

export default getExteriorColor;
