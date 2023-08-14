interface Props {
  totalCount: number;
}

function AllCount({ totalCount }: Props) {
  return (
    <div className='max-w-5xl mx-auto mt-5 mb-4 font-body3-medium text-grey-300'>
      전체 <span className='text-primary'>{totalCount}</span>
    </div>
  );
}

export default AllCount;
