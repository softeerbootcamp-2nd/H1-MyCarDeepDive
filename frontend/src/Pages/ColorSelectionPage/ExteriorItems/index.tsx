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
import { getExteriorColorType } from '@/api/color/getExteriorColor';
import ColorItems from '../ColorItems';
import { getInteriorColorType } from '@/api/color/getInteriorColors';

interface Props {
  initialColor: initialColorType | undefined;
  classifiedInteriorColor: getInteriorColorType | undefined;
  classifiedExteriorColor: getExteriorColorType | undefined;
  setExteriorCarImage: React.Dispatch<React.SetStateAction<string[]>>;
  setInteriorCarImage: React.Dispatch<React.SetStateAction<string | undefined>>;
  setView: React.Dispatch<React.SetStateAction<string>>;
}

function ExteriorItems({
  initialColor,
  classifiedExteriorColor,
  classifiedInteriorColor,
  setExteriorCarImage,
  setInteriorCarImage,
  setView,
}: Props) {
  const { color, carDispatch } = useContext(CarContext);

  useEffect(() => {
    if (!initialColor) return;
    if (
      classifiedExteriorColor?.data.available_colors.findIndex(
        item => item.color_id === color.exteriorColor.id,
      ) !== -1
    )
      return;
    const { color_id, name, img_url, price, choose_rate } = initialColor;
    carDispatch({
      type: SET_EXTERIORCOLOR,
      exteriorColor: {
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
    setView('exterial');
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
      type: SET_EXTERIORCOLOR,
      exteriorColor: {
        id: color_id,
        name,
        imgUrl: img_url,
        price,
        chooseRate: choose_rate,
      },
    });
    setExteriorCarImage(car_img_urls);
    if (opposite_color_ids.indexOf(color.interiorColor.id) !== -1) return;

    if (!classifiedInteriorColor) return;
    const {
      color_id: id,
      name: colorName,
      img_url: imgUrl,
      price: colorPrice,
      choose_rate: chooseRate,
      car_img_urls: carImgUrl,
    } = classifiedInteriorColor?.data.available_colors[0];

    carDispatch({
      type: SET_INTERIORCOLOR,
      interiorColor: {
        id,
        name: colorName,
        imgUrl,
        price: colorPrice,
        chooseRate,
      },
    });
    if (carImgUrl) setInteriorCarImage(carImgUrl[0]);
  };

  return (
    <ColorItems>
      {classifiedExteriorColor?.data.available_colors.map(
        (exteriorColor, index) => {
          return (
            <Items
              colorType={'exterior'}
              colorName={exteriorColor.name}
              key={index}
            >
              <Button
                colorName={exteriorColor.name}
                data={exteriorColor}
                clickHandler={clickHandler}
              >
                <Image
                  colorName={exteriorColor.name}
                  imgUrl={exteriorColor.img_url}
                />
                {exteriorColor.name === color.exteriorColor.name && (
                  <Icon imgUrl={CheckCircle} />
                )}
                {index < 3 && <Tag description='Top' index={index} />}
              </Button>
            </Items>
          );
        },
      )}
      {classifiedExteriorColor?.data.unavailable_colors.map(
        (exteriorColor, index) => {
          return (
            <Items
              colorType={'exterior'}
              colorName={exteriorColor.name}
              key={index}
            >
              <Button
                colorName={exteriorColor.name}
                data={exteriorColor}
                clickHandler={clickHandler}
              >
                <Image
                  colorName={exteriorColor.name}
                  imgUrl={exteriorColor.img_url}
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

export default ExteriorItems;
