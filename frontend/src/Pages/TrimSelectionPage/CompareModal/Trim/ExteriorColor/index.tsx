import ExteriorColorItem from './ExteriorColorItem';

interface ExteriorColorProps {
  exteriorColor: string[];
}

function ExteriorColor({ exteriorColor }: ExteriorColorProps) {
  return (
    <>
      <div className='font-body4-medium text-grey-200 mb-1'>외장 색상</div>
      <div
        className={`${
          exteriorColor.length === 6 ? 'w-[136px]' : 'w-[160px]'
        } mx-auto flex gap-2 justify-between`}
      >
        {exteriorColor.map(color => (
          <ExteriorColorItem color={color} key={color} />
        ))}
      </div>
    </>
  );
}

export default ExteriorColor;
