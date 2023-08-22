import CheckCircle from '@/assets/icon/check-circle-white.svg';
function AvailableIcon() {
  return (
    <>
      <div className='bg-primary absolute opacity-40 rounded top-0 left-0 w-full h-full z-10'></div>
      <img src={CheckCircle} alt='' className='absolute z-20' />
    </>
  );
}

export default AvailableIcon;
