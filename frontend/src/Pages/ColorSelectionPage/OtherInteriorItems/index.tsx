import React from 'react';
import Items from '../ColorItems/Items';
import TrimName from '../ColorItems/TrimName';
import Button from '../ColorItems/Button';
import Image from '../ColorItems/Image';
import { getInteriorColorType } from '@/api/color/getInteriorColors';

interface Props {
  classifiedInteriorColor: getInteriorColorType | undefined;
  clickHandler: ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => void;
  setShowModal: React.Dispatch<React.SetStateAction<boolean>>;
}
function OtherInteriorItems({ classifiedInteriorColor, clickHandler }: Props) {
  return (
    <div className='flex flex-wrap gap-x-4'>
      {classifiedInteriorColor?.data.other_trim_colors.map((color, index) => {
        return (
          <Items colorType={'other'} colorName={color.name} key={index}>
            <TrimName trimName={color.trim_name} />
            <Button
              colorName={color.name}
              data={color}
              clickHandler={clickHandler}
            >
              <Image colorName={color.name} imgUrl={color.img_url} />
            </Button>
          </Items>
        );
      })}
    </div>
  );
}

export default OtherInteriorItems;
