import CheckCircle from '@/assets/icon/check-circle-white.svg';
import Exclamation from '@/assets/icon/exclamation.png';
import Items from '../ColorItems/Items';
import Button from '../ColorItems/Button';
import Image from '../ColorItems/Image';
import Icon from '../ColorItems/Icon';
import Tag from '../ColorItems/Tag';
import { useContext, useEffect, useState } from 'react';
import { CarContext } from '@/context/CarProvider';
import { initialColorType } from '@/api/color/getAllColor';
import { SET_INTERIORCOLOR } from '@/context/CarProvider/type';
import ColorItems from '../ColorItems';
import { getInteriorColorType } from '@/api/color/getInteriorColors';
import useLogFetch from '@/hooks/useLogFetch';
import { closeModalHandler } from '@/utils';
import UnavailableChangerModal from '../UnavailableChangerModal';

interface Props {
  initialColor: initialColorType | undefined;
  classifiedInteriorColor: getInteriorColorType | undefined;
  setInteriorCarImage: React.Dispatch<React.SetStateAction<string | undefined>>;
  setView: React.Dispatch<React.SetStateAction<string>>;
}

function InteriorItems({
  initialColor,
  classifiedInteriorColor,
  setInteriorCarImage,
  setView,
}: Props) {
  const [wantedUnavailableColor, setWantedUnavailableColor] = useState<any>();
  const [showModal, setShowModal] = useState(false);
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
    const { color_id, name, img_url, price, choose_rate, car_img_urls } =
      colorInfo;

    useLogFetch({
      url: `/color/interior-colors/activity-log/${color_id}`,
    });

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
  };

  const clickUnavailableColorHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => {
    const dataObject = currentTarget.getAttribute('data-object');
    if (dataObject) {
      const colorInfo = JSON.parse(dataObject);
      setWantedUnavailableColor(colorInfo);
      setShowModal(true);
      useLogFetch({
        url: `/color/exterior-colors/activity-log/${colorInfo.color_id}`,
      });
    }
  };

  const changeUnavailableColorHandler = () => {
    setView('interial');
    closeModalHandler();
    const { color_id, name, img_url, price, choose_rate } =
      wantedUnavailableColor;

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
  };

  return (
    <>
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
                    <Icon imgUrl={CheckCircle} type='available' />
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
                  clickHandler={clickUnavailableColorHandler}
                >
                  <Image
                    colorName={interiorColor.name}
                    imgUrl={interiorColor.img_url}
                  />

                  <Icon imgUrl={Exclamation} type='unavailable' />
                </Button>
              </Items>
            );
          },
        )}
      </ColorItems>
      <UnavailableChangerModal
        type='interial'
        wantedUnavailableColor={wantedUnavailableColor}
        showModal={showModal}
        setShowModal={setShowModal}
        clickHandler={changeUnavailableColorHandler}
      />
    </>
  );
}

export default InteriorItems;
