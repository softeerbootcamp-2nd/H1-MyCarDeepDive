import { useContext } from 'react';
import { OptionContext } from '@/context/OptionProvider';
import useFetch, { GET } from '@/hooks/useFetch';

export interface getOptionDetailsType {
  status: { code: string; message: string };
  data: {
    option_id: number;
    option_name: string;
    option_description: string;
    tag_list: [
      {
        tag_id: number;
        tag_name: string;
      },
    ];
    price: number;
    option_img_url: string;
  };
}

function getOptionDetails(): getOptionDetailsType | undefined {
  const { optionId } = useContext(OptionContext);

  if (optionId === 0) return;
  return useFetch({
    method: GET,
    url: `/options/${optionId}/details`,
  });
}

export default getOptionDetails;
