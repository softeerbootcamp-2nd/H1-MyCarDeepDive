import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';
import useFetch, { GET } from '@/hooks/useFetch';
import { ColorType } from '@/global/type';

export interface getInteriorColorType {
  status: { code: string; message: string };
  data: {
    available_colors: ColorType[];
    unavailable_colors: ColorType[];
    other_trim_colors: ColorType[];
  };
}

function getInitialInteriorColor(): getInteriorColorType | undefined {
  const { carSpec, color } = useContext(CarContext);

  return useFetch({
    method: GET,
    url: `/color/interior-colors?trimId=${carSpec.trim.id}&exteriorColorId=${color.exteriorColor.id}`,
    showLoading: false,
  });
}

export default getInitialInteriorColor;
