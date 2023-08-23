const API = 'https://dev.make-my-car.shop/api/v1';

interface useLogFetchParameter {
  url: string;
}

async function useLogFetch({ url }: useLogFetchParameter) {
  try {
    const res = await fetch(API + url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
    });

    if (!res.ok) return console.log(url + ' 로그 전송 실패');

    console.log(url + ' 로그 전송 성공');
  } catch (error: any) {
    console.log(url + ' 로그 전송 실패');
  }

  return null;
}

export default useLogFetch;
