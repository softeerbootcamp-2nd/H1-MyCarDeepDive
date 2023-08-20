interface ExteriorColorItemProps {
  color: string;
}

function ExteriorColorItem({ color }: ExteriorColorItemProps) {
  return (
    <img
      className={`w-4 h-4 rounded-full`}
      src={'https://' + color}
      alt='외장 색상'
    />
  );
}

export default ExteriorColorItem;
