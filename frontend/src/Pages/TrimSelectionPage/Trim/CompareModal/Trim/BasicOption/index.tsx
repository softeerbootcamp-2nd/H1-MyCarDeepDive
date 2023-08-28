import BasicOptionItem from './BasicOptionItem';

interface BasicOptionProps {
  basic_option_names: string[];
  basic_option_ids: number[];
}

function BasicOption({ basic_option_names }: BasicOptionProps) {
  return (
    <>
      <div className='mb-3 font-body4-medium text-grey-300'>기본 옵션</div>
      <div className='flex flex-col gap-2'>
        {basic_option_names.map(option => (
          <BasicOptionItem option={option} key={option} />
        ))}
      </div>
    </>
  );
}

export default BasicOption;
