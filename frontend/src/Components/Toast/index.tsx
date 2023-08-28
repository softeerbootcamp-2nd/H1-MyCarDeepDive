import { useEffect, useState } from 'react';

interface Props {
  success: boolean;
  message: string;
  showToast: boolean;
  setShowToast: React.Dispatch<React.SetStateAction<boolean>>;
}

function Toast({ success, message, showToast, setShowToast }: Props) {
  const [animation, setAnimation] = useState(false);
  const [timer, setTimer] = useState<NodeJS.Timeout | undefined>(undefined);

  useEffect(() => {
    if (!showToast) return setAnimation(false);
    setTimeout(() => setAnimation(true), 10);

    setTimer(
      setTimeout(() => {
        setAnimation(false);
        setShowToast(false);
      }, 6000),
    );
  }, [showToast]);

  useEffect(() => {
    if (animation) return;

    setTimeout(() => {
      clearTimeout(timer);
      setTimer(undefined);
      setShowToast(false);
    }, 710);
  }, [animation]);

  useEffect(() => {
    return () => {
      if (timer) clearTimeout(timer);
      setTimer(undefined);
      setAnimation(false);
      setShowToast(false);
    };
  }, []);

  useEffect(() => {
    console.log(timer);
  }, [timer]);

  if (!showToast) return null;
  return (
    <div
      className={`flex items-center w-full max-w-sm p-4 text-gray-500 bg-white rounded-lg fixed top-10 right-10 transition-transform duration-700 ease-in-out ${
        animation ? 'translate-x-0' : 'translate-x-[500px]'
      }`}
    >
      {success ? (
        <div className='inline-flex items-center justify-center flex-shrink-0 w-8 h-8 text-green-500 bg-green-100 rounded-lg'>
          <svg
            className='w-5 h-5'
            aria-hidden='true'
            xmlns='http://www.w3.org/2000/svg'
            fill='currentColor'
            viewBox='0 0 20 20'
          >
            <path d='M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 8.207-4 4a1 1 0 0 1-1.414 0l-2-2a1 1 0 0 1 1.414-1.414L9 10.586l3.293-3.293a1 1 0 0 1 1.414 1.414Z' />
          </svg>
        </div>
      ) : (
        <div className='inline-flex items-center justify-center flex-shrink-0 w-8 h-8 text-red-500 bg-red-100 rounded-lg'>
          <svg
            className='w-5 h-5'
            aria-hidden='true'
            xmlns='http://www.w3.org/2000/svg'
            fill='currentColor'
            viewBox='0 0 20 20'
          >
            <path d='M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 11.793a1 1 0 1 1-1.414 1.414L10 11.414l-2.293 2.293a1 1 0 0 1-1.414-1.414L8.586 10 6.293 7.707a1 1 0 0 1 1.414-1.414L10 8.586l2.293-2.293a1 1 0 0 1 1.414 1.414L11.414 10l2.293 2.293Z' />
          </svg>
        </div>
      )}
      <div className='ml-3 font-body4-regular text-grey-400'>{message}</div>
      <button
        type='button'
        className='ml-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg focus:ring-2 focus:ring-gray-300 p-1.5 hover:bg-gray-100 inline-flex items-center justify-center h-8 w-8'
        onClick={() => {
          setAnimation(false);
        }}
      >
        <svg
          className='w-3 h-3'
          aria-hidden='true'
          xmlns='http://www.w3.org/2000/svg'
          fill='none'
          viewBox='0 0 14 14'
        >
          <path
            stroke='currentColor'
            strokeLinecap='round'
            strokeLinejoin='round'
            strokeWidth='2'
            d='m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6'
          />
        </svg>
      </button>
    </div>
  );
}

export default Toast;
