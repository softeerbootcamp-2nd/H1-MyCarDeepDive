interface Props {
  title: string;
}

function Title({ title }: Props) {
  return <p className='mb-[18px] font-body2-medium text-grey-100'>{title} </p>;
}

export default Title;
