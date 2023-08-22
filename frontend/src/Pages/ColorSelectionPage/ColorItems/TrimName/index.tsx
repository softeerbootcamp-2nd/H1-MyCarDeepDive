interface Props {
  trimName: string;
}
function TrimName({ trimName }: Props) {
  return (
    <p className='font-body2-bold flex items-start mb-1'>
      <span className='text-[11px] leading-normal text-secondary'>
        {trimName}
      </span>
    </p>
  );
}

export default TrimName;
