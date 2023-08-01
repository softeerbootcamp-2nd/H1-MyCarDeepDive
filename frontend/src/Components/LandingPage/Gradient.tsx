function Gradient() {
  return (
    <>
      <div className="absolute z-10 top-0 left-0 w-full h-1/2 bg-gradient-to-t from-transparent from-20% to-black to-80%"></div>
      <div className="absolute z-10 top-1/2 left-0 w-full h-1/2 bg-gradient-to-t from-black from-20% to-transparent to-80%"></div>
    </>
  );
}

export default Gradient;
