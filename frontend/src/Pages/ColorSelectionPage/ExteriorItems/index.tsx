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
import { SET_EXTERIORCOLOR } from '@/context/CarProvider/type';
import { getExteriorColorType } from '@/api/color/getExteriorColor';
import ColorItems from '../ColorItems';
import useLogFetch from '@/hooks/useLogFetch';

interface Props {
  initialColor: initialColorType | undefined;
  classifiedExteriorColor: getExteriorColorType | undefined;
  setExteriorCarImage: React.Dispatch<React.SetStateAction<string[]>>;
  setView: React.Dispatch<React.SetStateAction<string>>;
}

function ExteriorItems({
  initialColor,
  classifiedExteriorColor,
  setExteriorCarImage,
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
    const { color_id, name, img_url, price, choose_rate, car_img_urls } =
      colorInfo;

    useLogFetch({
      url: `/color/exterior-colors/activity-log/${color_id}`,
    });

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
                  <Icon imgUrl={CheckCircle} type='available' />
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
                <Icon imgUrl={Exclamation} type='unavailable' />
              </Button>
            </Items>
          );
        },
      )}
    </ColorItems>
  );
}

export default ExteriorItems;
