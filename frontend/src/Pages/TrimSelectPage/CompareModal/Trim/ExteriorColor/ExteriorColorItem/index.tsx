interface ExteriorColorItemProps {
  color: string;
}

function ExteriorColorItem({ color }: ExteriorColorItemProps) {
  return <div className={`w-4 h-4 bg-[${color}] rounded-full`} />;
}

export default ExteriorColorItem;
