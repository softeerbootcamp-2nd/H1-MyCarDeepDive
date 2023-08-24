import { useContext } from 'react';
import { CarContext } from '@/context/CarProvider';
import useFetch, { POST } from '@/hooks/useFetch';

export interface postResultType {
  status: { code: string; message: string };
  data: {
    pdfId: string;
  };
}

function postResult(): postResultType | undefined {
  const { carSpec, color, optionIdList } = useContext(CarContext);

  const body = {
    car_spec_id: carSpec.id,
    trim_id: carSpec.trim.id,
    exterior_color_id: color.exteriorColor.id,
    interior_color_id: color.interiorColor.id,
    additional_option_id_list: optionIdList,
  };

  return useFetch({
    method: POST,
    url: `/pdfId`,
    body: body,
    showLoading: true,
  });
}

export default postResult;
