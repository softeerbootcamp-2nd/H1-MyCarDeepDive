import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import postResult, { postResultType } from '@/api/myCar/postResult';

function MyCarReady() {
  const navigation = useNavigate();
  const data: postResultType | undefined = postResult();

  useEffect(() => {
    if (data === undefined) return;

    console.log(data);
    navigation('/mycar/result', { replace: true });
  }, [data]);

  return null;
}

export default MyCarReady;
