import CheckCircle from '@/assets/icon/check-circle-white.svg';
import { ColorType } from '@/global/type';
import React from 'react';
import Items from './Items';
import TrimName from './TrimName';
import Button from './Button';
import Image from './Image';
import Icon from './Icon';
import Tag from './Tag';

interface colorProps {
  trim?: string;
  name: string;
  imgUrl: string;
  price: number;
}

interface Props {
  data: {
    availableColor?: ColorType[] | undefined;
    unavailableColor?: ColorType[] | undefined;
    otherColorOfTrim?: ColorType[] | undefined;
  };

  colorType: 'interior' | 'exterior' | 'other';
  clickHandler: {
    clickAvailableColorHandler: (
      e: React.MouseEvent<HTMLButtonElement, MouseEvent>,
    ) => void;
  };
  selectedColor?: colorProps;
  setShowModal?: (value: boolean) => void;
}

function ColorItems({
  data,
  colorType,
  selectedColor,
  setShowModal,
  clickHandler,
}: Props) {
  if (!data.availableColor) return;
  const showOtherColorChangePopup = (
    e: React.MouseEvent<HTMLButtonElement>,
  ) => {
    if (setShowModal && clickHandler) {
      clickHandler.clickAvailableColorHandler(e);
      setShowModal(true);
    }
  };

  return (
    <div className='flex flex-wrap gap-x-4'>
      {colorType === 'other' &&
        data.otherColorOfTrim?.map((color, index) => {
          return (
            <Items colorType={colorType} colorName={color.name} key={index}>
              <TrimName trimName={color.trim_name} />
              <Button
                colorName={color.name}
                data={color}
                clickHandler={showOtherColorChangePopup}
              >
                <Image colorName={color.name} imgUrl={color.img_url} />
              </Button>
            </Items>
          );
        })}

      {colorType !== 'other' &&
        data.availableColor.map((color, index) => {
          return (
            <Items colorType={colorType} colorName={color.name} key={index}>
              <Button
                colorName={color.name}
                data={color}
                clickHandler={clickHandler.clickAvailableColorHandler}
              >
                <Image colorName={color.name} imgUrl={color.img_url} />
                {color.name === selectedColor?.name && (
                  <Icon imgUrl={CheckCircle} />
                )}
                {colorType === 'exterior' && index < 3 && (
                  <Tag description='Top' index={index} />
                )}
                {colorType === 'interior' && index === 0 && (
                  <Tag description='Best' />
                )}
              </Button>
            </Items>
          );
        })}
    </div>
  );
}

export default ColorItems;
