import SelectionCarImg from '@/assets/icon/image-358.svg';
function SelectPage() {
  return (
    <>
      <div
        className={`fixed top-[120px] selectCarBackground flex justify-center items-center `}
      >
        <div
          className='absolute top-0 h-[55%] w-full'
          style={{ background: 'rgba(0, 66, 142, 0.10)' }}
        ></div>
        <div
          className='absolute bottom-0 h-[45%] w-full'
          style={{
            background:
              'linear-gradient(180deg, rgba(0, 66, 142, 0.30) 0%, rgba(255, 255, 255, 0.00) 100%)',
          }}
        ></div>
        <img src={SelectionCarImg} className='w-[85%] z-10 ml-16'></img>
      </div>

      <div className='absolute top-0 w-[416px] right-0 mt-[120px] px-12 py-[51px]'></div>
    </>
  );
}

export default SelectPage;
