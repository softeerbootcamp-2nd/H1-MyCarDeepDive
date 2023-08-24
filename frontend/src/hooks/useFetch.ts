import { useContext, useEffect, useState, useTransition } from 'react';
import { CacheContext } from '@/context/CacheProvider';
import { useNavigate } from 'react-router-dom';

const API = 'https://dev.make-my-car.shop/api/v1';

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
  const [isPending, startTransition] = useTransition();
  const { getByCache, setByCache } = useContext(CacheContext);

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
    const cacheData = getByCache(url);
    if (cacheData) return resolvePromise(cacheData);

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
      if (method === GET) setByCache(url, data);
      resolvePromise(data);
    } catch (error: any) {
      rejectPromise(error);
    }
  };

  useEffect(() => {
    setStatus(PENDING);
    startTransition(() => {
      setPromise(fetchData());
    });
    // setPromise(fetchData());
  }, [url]);

  if (isPending) return undefined;
  if (status === PENDING && promise) throw promise;
  if (status === ERROR) throw error;
  return result;
}

export default useFetch;

export { GET, POST };
