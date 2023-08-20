import ExteriorColorItem from './ExteriorColorItem';

interface ExteriorColorProps {
  exterior_color_img_urls: string[];
}

function ExteriorColor({ exterior_color_img_urls }: ExteriorColorProps) {
  return (
    <>
      <div className='font-body4-medium text-grey-200 mb-1'>외장 색상</div>
      <div
        className={`${
          exterior_color_img_urls.length === 6 ? 'w-[136px]' : 'w-[160px]'
        } mx-auto flex gap-2 justify-between`}
      >
        {exterior_color_img_urls.map(color => (
          <ExteriorColorItem color={color} key={color} />
        ))}
      </div>
    </>
  );
}

export default ExteriorColor;
