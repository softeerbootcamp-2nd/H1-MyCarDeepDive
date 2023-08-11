interface TrimClusterProps {
  clusterImage: string;
  clusterName: string;
  clusterSize: string;
}

function TrimCluster({
  clusterImage,
  clusterName,
  clusterSize,
}: TrimClusterProps) {
  return (
    <>
      <img
        src={clusterImage}
        alt={clusterName}
        className='mt-[51px] mb-2 mx-auto'
      />
      <div className='font-h1-bold text-secondary mb-1'>{clusterSize}</div>
      <div className='font-body3-regular text-grey-300'>
        <span className='leading-[16px]'>{clusterName}</span>
      </div>
    </>
  );
}

export default TrimCluster;
