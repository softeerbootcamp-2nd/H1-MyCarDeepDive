function ExteriorTag({ index }: { index: number }) {
  return (
    index < 3 && (
      <p className='font-caption1-medium bg-grey-300 text-grey-1000 w-10 h-5 flex justify-center items-center rounded-tl rounded-br absolute top-0 left-0'>
        Top {index + 1}
      </p>
    )
  );
}

export default ExteriorTag;
