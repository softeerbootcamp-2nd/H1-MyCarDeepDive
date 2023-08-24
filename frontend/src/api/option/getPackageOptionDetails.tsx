import { useContext } from 'react';
import { OptionContext } from '@/context/OptionProvider';
import useFetch, { GET } from '@/hooks/useFetch';
import { optionDetailType } from '@/global/type';

export interface getPackageOptionDetailsType {
  status: { code: string; message: string };
  data: optionDetailType[];
}

function getPackageOptionDetails(): getPackageOptionDetailsType | undefined {
  const { optionId, packageOption } = useContext(OptionContext);

  if (optionId === 0 || packageOption === false) return;
  return useFetch({
    method: GET,
    url: `/options/package/${optionId}/details`,
  });
}

export default getPackageOptionDetails;
