interface BasicOptionItemProps {
  option: string;
  option_id: number;
}

function BasicOptionItem({ option, option_id }: BasicOptionItemProps) {
  return (
    <div
      className='font-body4-regular text-secondary'
      onClick={() => console.log(option_id)}
    >
      {option}
    </div>
  );
}

export default BasicOptionItem;
