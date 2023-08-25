const API = 'https://api.make-my-car.shop/api/v1';

interface useLogFetchParameter {
  url: string;
}

async function useLogFetch({ url }: useLogFetchParameter) {
  await fetch(API + url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
  });

  return null;
}

export default useLogFetch;
