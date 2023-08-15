interface colorProps {
  trim?: string;
  name: string;
  chooseRate: number;
  url: string;
}
function Explain({ wantedOtherColor }: { wantedOtherColor: colorProps }) {
  return (
    <p className='font-body4-regular text-grey-400 mb-9'>
      {wantedOtherColor.name} 색상은 트림 변경 후 선택할 수 있어요.
    </p>
  );
}

export default Explain;
