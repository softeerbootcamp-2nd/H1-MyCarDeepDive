interface InteriorColorProps {
  interiorColor: string;
  interiorColor2?: string;
}

function InteriorColor({ interiorColor, interiorColor2 }: InteriorColorProps) {
  return (
    <>
      <div className='mt-4 font-body4-medium text-grey-200'>내장 색상</div>
      <div className='mt-[5px] font-body4-regular text-grey-300'>
        {interiorColor}
      </div>
      {interiorColor2 && (
        <div className='mt-1 font-body4-regular text-grey-300'>
          {interiorColor2}
        </div>
      )}
    </>
  );
}

export default InteriorColor;
