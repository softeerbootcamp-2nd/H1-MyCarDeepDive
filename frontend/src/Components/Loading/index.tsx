import loadingCar from '@/assets/image/Loading_Car.gif';

function Loading() {
  console.log('loading');

  return (
    <div className='fixed top-0 left-0 z-50 overflow-y-auto md:inset-0 min-h-screen bg-bgModal scale-100 transition-opacity duration-1000'>
      <div className='w-[300px] h-[180px] absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-grey-1000 rounded'>
        <div className='flex flex-col justify-center items-center w-full h-full gap-4'>
          <img src={loadingCar} alt='loading...' />
          <p className='font-body2-medium text-grey-0'>잠시만 기다려 주세요.</p>
        </div>
      </div>
    </div>
  );
}

export default Loading;
