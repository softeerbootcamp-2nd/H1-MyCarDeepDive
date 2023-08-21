interface TrimCarImageProps {
  trims_img_url: string;
  trim_name: string;
}

function TrimCarImage({ trims_img_url, trim_name }: TrimCarImageProps) {
  return <img src={'https://' + trims_img_url} alt={trim_name} />;
}

export default TrimCarImage;
