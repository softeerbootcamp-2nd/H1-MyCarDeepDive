interface NavBarSelectedProps {
  offsetX: number;
}

function NavBarSelected({ offsetX }: NavBarSelectedProps) {
  return (
    <hr
      className={`w-24 h-0.5 bg-primary border-0 absolute bottom-0 transition-transform duration-300 ease-in-out`}
      style={{
        transform: `translateX(${offsetX}px)`,
      }}
    />
  );
}

export default NavBarSelected;
