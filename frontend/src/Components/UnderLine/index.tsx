interface UnderLineProps {
  margin: string;
  color?: string;
}

function UnderLine({ margin, color }: UnderLineProps) {
  return (
    <hr
      className={`${color ? color : 'bg-grey-700'} ${margin} h-px border-0`}
    />
  );
}

export default UnderLine;
