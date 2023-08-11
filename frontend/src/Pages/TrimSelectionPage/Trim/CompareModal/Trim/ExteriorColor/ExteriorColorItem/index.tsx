interface ExteriorColorItemProps {
  color: string;
}

function ExteriorColorItem({ color }: ExteriorColorItemProps) {
  return (
    <div
      className={`w-4 h-4 rounded-full`}
      style={{ backgroundColor: color }}
    />
  );
}

export default ExteriorColorItem;
