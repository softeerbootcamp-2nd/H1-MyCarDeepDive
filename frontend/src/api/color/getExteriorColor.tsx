import { useContext, useEffect, useState } from 'react';
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
  const [interiorId, setInteriorId] = useState(0);

  useEffect(() => {
    setInteriorId(color.interiorColor.id);
  }, [color.interiorColor.id]);

  return useFetch({
    method: GET,
    url: `/color/exterior-colors?trimId=${carSpec.trim.id}&interiorColorId=${interiorId}`,
    showLoading: false,
  });
}

export default getExteriorColor;
