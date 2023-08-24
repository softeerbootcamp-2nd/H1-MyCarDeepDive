import { useContext, useEffect, useState } from 'react';
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

function getInteriorColor(): getInteriorColorType | undefined {
  const { carSpec, color } = useContext(CarContext);
  const [exteriorId, setExteriorId] = useState(0);

  useEffect(() => {
    setExteriorId(color.exteriorColor.id);
  }, [color.exteriorColor.id]);

  return useFetch({
    method: GET,
    url: `/color/interior-colors?trimId=${carSpec.trim.id}&exteriorColorId=${exteriorId}`,
  });
}

export default getInteriorColor;
