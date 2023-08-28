interface Props {
  wantedOtherColor: any;
  description: string;
}
function Explain({ wantedOtherColor, description }: Props) {
  return (
    <p className='font-body4-regular text-grey-400 mb-9'>
      {wantedOtherColor.name} {description}
    </p>
  );
}

export default Explain;
