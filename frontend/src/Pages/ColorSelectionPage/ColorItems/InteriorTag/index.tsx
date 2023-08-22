function InteriorTag({ index }: { index: number }) {
  return (
    index === 0 && (
      <p className='font-caption1-medium bg-grey-300 text-grey-1000 w-10 h-5 flex justify-center items-center rounded-tl rounded-br absolute top-0 left-0'>
        Best
      </p>
    )
  );
}

export default InteriorTag;
