function Comment() {
  return (
    <div className='fixed top-[143px] left-0 w-full z-20 font-body2-regular text-grey-1000'>
      <div className='max-w-5xl mx-auto'>
        <p className='text-[28px] leading-[42px]'>
          당신의{' '}
          <span className='font-h2-medium'>
            <span className='text-[28px] leading-[42px]'>라이프스타일</span>
          </span>
          에 맞게 <br />
          차량을 추천해드려요
        </p>
      </div>
    </div>
  );
}

export default Comment;
