import Button from '@/Components/Button';
import errorIcon from '@/assets/icon/error.svg';
import { useNavigate, useParams } from 'react-router-dom';

function ErrorPage() {
  const { status } = useParams();
  const navigation = useNavigate();

  const message =
    status === 'server'
      ? '서버 통신 중 오류가 발생했어요.'
      : '페이지를 찾을 수 없어요';

  return (
    <div className='w-full h-screen flex justify-center items-center'>
      <div className='w-full h-1/2 flex flex-col justify-center items-center gap-20'>
        <div className='font-h1-medium text-grey-50'>{message}</div>
        <img src={errorIcon} alt='error' className='w-56' />
        <Button
          width='w-96'
          height='h-12'
          variant='primary'
          text='확인'
          onClick={() => navigation(-1)}
        />
      </div>
    </div>
  );
}

export default ErrorPage;
