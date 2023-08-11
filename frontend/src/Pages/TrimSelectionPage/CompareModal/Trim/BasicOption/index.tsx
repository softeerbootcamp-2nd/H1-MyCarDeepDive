import BasicOptionItem from './BasicOptionItem';

interface BasicOptionProps {
  basicOption: string[];
}

function BasicOption({ basicOption }: BasicOptionProps) {
  return (
    <>
      <div className='mb-3 font-body4-medium text-grey-300'>기본 옵션</div>
      <div className='flex flex-col gap-2'>
        {basicOption.map(option => (
          <BasicOptionItem option={option} key={option} />
        ))}
      </div>
    </>
  );
}

export default BasicOption;
