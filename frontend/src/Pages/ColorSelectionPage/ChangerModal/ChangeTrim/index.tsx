import TrimInfo from '../TrimInfo';

interface Props {
  wantedOtherColorTrim: any;
}

function ChangeTrim({ wantedOtherColorTrim }: Props) {
  return (
    <TrimInfo
      title='변경 트림'
      trimName={wantedOtherColorTrim.trim_name}
      trimPrice={wantedOtherColorTrim.price}
    />
  );
}

export default ChangeTrim;
