import { useContext } from 'react';
import { OptionContext } from '@/context/OptionProvider';
import useFetch, { GET } from '@/hooks/useFetch';
import { optionDetailType } from '@/global/type';

export interface getOptionDetailsType {
  status: { code: string; message: string };
  data: optionDetailType;
}

function getOptionDetails(): getOptionDetailsType | undefined {
  const { optionId, packageOption } = useContext(OptionContext);

  if (optionId === 0 || packageOption === true) return;
  return useFetch({
    method: GET,
    url: `/options/${optionId}/details`,
  });
}

export default getOptionDetails;
