interface BasicOptionItemProps {
  option: string;
}

function BasicOptionItem({ option }: BasicOptionItemProps) {
  return <div className='font-body4-regular text-secondary'>{option}</div>;
}

export default BasicOptionItem;
