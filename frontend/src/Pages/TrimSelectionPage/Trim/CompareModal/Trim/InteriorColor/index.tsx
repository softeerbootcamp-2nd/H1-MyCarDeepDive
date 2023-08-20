interface InteriorColorProps {
  interior_color_names: string[];
}

function InteriorColor({ interior_color_names }: InteriorColorProps) {
  return (
    <>
      <div className='mt-4 font-body4-medium text-grey-200'>내장 색상</div>
      <div className='mt-[5px] font-body4-regular text-grey-300'>
        {interior_color_names[0]}
      </div>
      {interior_color_names[1] && (
        <div className='mt-1 font-body4-regular text-grey-300'>
          {interior_color_names[1]}
        </div>
      )}
    </>
  );
}

export default InteriorColor;
