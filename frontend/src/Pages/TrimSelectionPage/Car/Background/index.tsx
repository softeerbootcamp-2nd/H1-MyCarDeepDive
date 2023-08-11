function Background() {
  return (
    <>
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
    </>
  );
}

export default Background;
