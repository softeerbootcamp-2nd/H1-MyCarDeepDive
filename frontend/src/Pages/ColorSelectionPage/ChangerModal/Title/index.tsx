interface Props {
  description: string;
}
function Title({ description }: Props) {
  return <div className='mb-2 font-h1-medium text-grey-50'>{description}</div>;
}

export default Title;
