import { getExteriorColorType } from '@/api/color/getExteriorColor';
import { ReactNode } from 'react';

interface Props {
  children: ReactNode;
  showOtherColor: boolean;
  classifiedExteriorColor: getExteriorColorType | undefined;
}
function DropDownContent({
  children,
  showOtherColor,
  classifiedExteriorColor,
}: Props) {
  return (
    <div
      className={`overflow-hidden transition-all duration-1000 ${
        showOtherColor ? 'max-h-[1000px]' : 'max-h-0'
      }`}
    >
      {children}
      {showOtherColor &&
        !classifiedExteriorColor?.data.other_trim_colors.length && (
          <p className='flex justify-center items-center py-10 font-body4-medium text-grey-500 '>
            다른 색상이 없습니다.
          </p>
        )}
    </div>
  );
}

export default DropDownContent;
