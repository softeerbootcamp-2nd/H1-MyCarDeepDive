interface props {
  colorName: string;
}
function ColorName({ colorName }: props) {
  return <p className='font-caption1-regular text-grey-100'>{colorName}</p>;
}

export default ColorName;
