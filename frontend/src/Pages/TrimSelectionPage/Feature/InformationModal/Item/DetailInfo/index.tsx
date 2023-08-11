interface DetailInfoProps {
  datail: {
    key: string;
    value: string;
  };
}

function DetailInfo({ datail }: DetailInfoProps) {
  return (
    <div className='flex tracking-[-2.2%]'>
      <span className='font-body4-regular text-grey-400 mr-4'>
        <span className='leading-[18px]'>{datail.key}</span>
      </span>
      <span className='font-body3-medium text-grey-200'>
        <span className='leading-5'>{datail.value}</span>
      </span>
    </div>
  );
}

export default DetailInfo;
