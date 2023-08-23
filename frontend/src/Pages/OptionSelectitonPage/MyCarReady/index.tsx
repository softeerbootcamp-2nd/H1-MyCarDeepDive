import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import postResult, { postResultType } from '@/api/myCar/postResult';

function MyCarReady() {
  const navigation = useNavigate();
  const resultData: postResultType | undefined = postResult();

  useEffect(() => {
    if (resultData === undefined) return;

    navigation(`/mycar/result/${resultData.data.pdfId}`, { replace: true });
  }, [resultData]);

  return null;
}

export default MyCarReady;
