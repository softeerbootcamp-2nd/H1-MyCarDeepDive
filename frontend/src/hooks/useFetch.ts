import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';

const API = 'https://api.make-my-car.shop/api/v1';

const PENDING = 'pending';
const FULFILLED = 'fulfilled';
const ERROR = 'error';

const GET = 'get';
const POST = 'post';

interface useFetchParameter {
  method: 'get' | 'post';
  url: string;
  body?: {};
}

function useFetch<T>({ method, url, body }: useFetchParameter) {
  const navigation = useNavigate();
  const [promise, setPromise] = useState<Promise<any>>();
  const [status, setStatus] = useState<'pending' | 'fulfilled' | 'error'>(
    PENDING,
  );
  const [result, setResult] = useState<T>();
  const [error, setError] = useState<Error>();

  const resolvePromise = (result: any) => {
    setStatus(FULFILLED);
    setResult(result);
  };

  const rejectPromise = (error: Error) => {
    navigation('/error/server');
    setStatus(ERROR);
    setError(error);
  };

  const fetchData = async () => {
    try {
      const config = {
        method,
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(body),
      };

      const res = await fetch(API + url, body && config);

      if (!res.ok) return navigation('/error/server');

      const data = await res.json();
      resolvePromise(data);
    } catch (error: any) {
      rejectPromise(error);
    }
  };

  useEffect(() => {
    setStatus(PENDING);
    setPromise(fetchData());
  }, [url]);

  if (status === PENDING && promise) throw promise;
  if (status === ERROR) throw error;
  return result;
}

export default useFetch;

export { GET, POST };
