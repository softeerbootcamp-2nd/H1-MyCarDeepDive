interface ImageProps {
  colorName: string;
  imgUrl: string;
}

function Image({ colorName, imgUrl }: ImageProps) {
  return (
    <img
      src={`https://${imgUrl}`}
      alt={`{exterior-${colorName}}`}
      className={`rounded${
        colorName === '크리미 화이트 펄' ? 'border border-grey-700 rounded' : ''
      }`}
    />
  );
}

export default Image;
