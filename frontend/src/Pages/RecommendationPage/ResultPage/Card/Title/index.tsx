interface Props {
  trim_name: string;
}

function Title({ trim_name }: Props) {
  return (
    <div className='mt-[29px] mx-auto text-center'>
      <span className='inline-block bg-primary rounded-full px-3 py-1.5 font-caption1-medium'>
        <span className='leading-4 text-grey-1000'>
          {'펠리세이드 - ' + trim_name}
        </span>
      </span>
    </div>
  );
}

export default Title;
