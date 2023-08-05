interface UnderLineProps {
  margin: string;
}

function UnderLine({ margin }: UnderLineProps) {
  return <hr className={`${margin} h-px bg-grey-700 border-0`} />;
}

export default UnderLine;
