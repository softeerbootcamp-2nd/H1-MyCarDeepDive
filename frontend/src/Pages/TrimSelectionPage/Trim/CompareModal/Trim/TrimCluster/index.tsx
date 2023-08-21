import cluster from '@/assets/icon/Cluster.svg';

interface TrimClusterProps {
  cluster_size: number;
}

function TrimCluster({ cluster_size }: TrimClusterProps) {
  return (
    <>
      <img src={cluster} alt={'클러스터'} className='mt-[51px] mb-2 mx-auto' />
      <div className='font-h1-bold text-secondary mb-1'>
        {cluster_size + ' inch '}
      </div>
      <div className='font-body3-regular text-grey-300'>
        <span className='leading-[16px]'>{'클러스터'}</span>
      </div>
    </>
  );
}

export default TrimCluster;
