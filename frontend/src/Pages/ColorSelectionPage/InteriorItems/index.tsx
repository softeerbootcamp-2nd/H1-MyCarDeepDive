import CheckCircle from '@/assets/icon/check-circle-white.svg';
import Exclamation from '@/assets/icon/exclamation.png';
import Items from '../ColorItems/Items';
import Button from '../ColorItems/Button';
import Image from '../ColorItems/Image';
import Icon from '../ColorItems/Icon';
import Tag from '../ColorItems/Tag';
import { useContext, useEffect } from 'react';
import { CarContext } from '@/context/CarProvider';
import { initialColorType } from '@/api/color/getAllColor';
import {
  SET_EXTERIORCOLOR,
  SET_INTERIORCOLOR,
} from '@/context/CarProvider/type';
import ColorItems from '../ColorItems';
import { getInteriorColorType } from '@/api/color/getInteriorColors';
import { getExteriorColorType } from '@/api/color/getExteriorColor';

interface Props {
  initialColor: initialColorType | undefined;
  classifiedInteriorColor: getInteriorColorType | undefined;
  classifiedExteriorColor: getExteriorColorType | undefined;
  setExteriorCarImage: React.Dispatch<React.SetStateAction<string[]>>;
  setInteriorCarImage: React.Dispatch<React.SetStateAction<string | undefined>>;
  setView: React.Dispatch<React.SetStateAction<string>>;
}

function InteriorItems({
  initialColor,
  classifiedInteriorColor,
  classifiedExteriorColor,
  setExteriorCarImage,
  setInteriorCarImage,
  setView,
}: Props) {
  const { color, carDispatch } = useContext(CarContext);
  useEffect(() => {
    if (!initialColor) return;
    if (
      classifiedInteriorColor?.data.available_colors.findIndex(
        item => item.color_id === color.interiorColor.id,
      ) !== -1
    )
      return;
    const { color_id, name, img_url, price, choose_rate } = initialColor;
    carDispatch({
      type: SET_INTERIORCOLOR,
      interiorColor: {
        id: color_id,
        name,
        imgUrl: img_url,
        price,
        chooseRate: choose_rate,
      },
    });
  }, [initialColor]);

  const clickHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => {
    setView('interial');
    const dataObject = currentTarget.getAttribute('data-object');
    if (!dataObject) return;
    const colorInfo = JSON.parse(dataObject);
    const {
      color_id,
      name,
      img_url,
      price,
      choose_rate,
      opposite_color_ids,
      car_img_urls,
    } = colorInfo;
    carDispatch({
      type: SET_INTERIORCOLOR,
      interiorColor: {
        id: color_id,
        name,
        imgUrl: img_url,
        price,
        chooseRate: choose_rate,
      },
    });
    if (car_img_urls) setInteriorCarImage(car_img_urls[0]);

    if (opposite_color_ids.indexOf(color.exteriorColor.id) !== -1) return;

    if (!classifiedExteriorColor) return;
    const {
      color_id: id,
      name: colorName,
      img_url: imgUrl,
      price: colorPrice,
      choose_rate: chooseRate,
      car_img_urls: carImgUrls,
    } = classifiedExteriorColor?.data.available_colors[0];

    carDispatch({
      type: SET_EXTERIORCOLOR,
      exteriorColor: {
        id,
        name: colorName,
        imgUrl,
        price: colorPrice,
        chooseRate,
      },
    });
    if (carImgUrls) setExteriorCarImage(carImgUrls);
  };

  return (
    <ColorItems>
      {classifiedInteriorColor?.data.available_colors.map(
        (interiorColor, index) => {
          return (
            <Items
              colorType={'interior'}
              colorName={interiorColor.name}
              key={index}
            >
              <Button
                colorName={interiorColor.name}
                data={interiorColor}
                clickHandler={clickHandler}
              >
                <Image
                  colorName={interiorColor.name}
                  imgUrl={interiorColor.img_url}
                />
                {interiorColor.name === color.interiorColor.name && (
                  <Icon imgUrl={CheckCircle} />
                )}
                {index === 0 && <Tag description='Best' />}
              </Button>
            </Items>
          );
        },
      )}
      {classifiedInteriorColor?.data.unavailable_colors.map(
        (interiorColor, index) => {
          return (
            <Items
              colorType={'interior'}
              colorName={interiorColor.name}
              key={index}
            >
              <Button
                colorName={interiorColor.name}
                data={interiorColor}
                clickHandler={clickHandler}
              >
                <Image
                  colorName={interiorColor.name}
                  imgUrl={interiorColor.img_url}
                />

                <Icon imgUrl={Exclamation} />
              </Button>
            </Items>
          );
        },
      )}
    </ColorItems>
  );
}

export default InteriorItems;
