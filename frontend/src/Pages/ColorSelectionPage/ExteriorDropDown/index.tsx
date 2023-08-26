import { CarContext } from '@/context/CarProvider';
import { useContext, useState } from 'react';
import DropDown from '../DropDown';
import DropDownButton from '../DropDown/DropDownButton';
import DropDownContent from '../DropDown/DropDownContent';
import OtherExteriorItems from '../OtherExteriorItems';
import { closeModalHandler } from '@/utils';
import {
  SET_CARSPECID,
  SET_CARSPECPRICE,
  SET_EXTERIORCOLOR,
  SET_TRIMID,
  SET_TRIMNAME,
} from '@/context/CarProvider/type';
import { getInteriorColorType } from '@/api/color/getInteriorColors';
import { getTrimType } from '@/api/trim/getTrim';
import ChangerModal from '../ChangerModal';
import { getExteriorColorType } from '@/api/color/getExteriorColor';
import useLogFetch from '@/hooks/useLogFetch';

interface Props {
  classifiedExteriorColor: getExteriorColorType | undefined;
  classifiedInteriorColor: getInteriorColorType | undefined;
  getTrimInfo: getTrimType | undefined;
  setExteriorCarImage: React.Dispatch<React.SetStateAction<string[]>>;
  setInteriorCarImage: React.Dispatch<React.SetStateAction<string | undefined>>;
  setView: React.Dispatch<React.SetStateAction<string>>;
}

function ExteriorDropDown({
  classifiedExteriorColor,
  getTrimInfo,
  setExteriorCarImage,
  setView,
}: Props) {
  const [showOtherColor, setShowOtherColor] = useState(false);
  const [wantedOtherColor, setWantedOtherColor] = useState<any>();
  const [wantedOtherColorTrim, setWantedOtherColorTrim] = useState<any>();
  const [showModal, setShowModal] = useState(false);
  const { carDispatch } = useContext(CarContext);

  const clickHandler = ({
    currentTarget,
  }: React.MouseEvent<HTMLButtonElement>) => {
    const dataObject = currentTarget.getAttribute('data-object');
    if (dataObject) {
      const colorInfo = JSON.parse(dataObject);
      setWantedOtherColor(colorInfo);
      const index = getTrimInfo?.data.car_specs.findIndex(
        id => id.trim_id === colorInfo.trim_id,
      );
      if (index === undefined || !getTrimInfo) return;
      const wantedOtherColorTrim = getTrimInfo?.data.car_specs[index];
      setWantedOtherColorTrim(wantedOtherColorTrim);
      setShowModal(true);
      useLogFetch({
        url: `/color/exterior-colors/activity-log/${colorInfo.color_id}`,
      });
    }
  };

  const changeHandler = () => {
    setView('exterial');
    closeModalHandler();
    const {
      color_id,
      name,
      img_url,
      price,
      choose_rate,
      trim_id,
      car_img_urls,
    } = wantedOtherColor;
    const index = getTrimInfo?.data.car_specs.findIndex(
      id => id.trim_id === trim_id,
    );

    if (index === undefined || !getTrimInfo) return;
    const {
      trim_id: trimId,
      trim_name,
      car_spec_id: carSpecId,
      price: carSpecPrice,
    } = getTrimInfo.data.car_specs[index];

    carDispatch({ type: SET_TRIMID, trimId });
    carDispatch({ type: SET_TRIMNAME, trimName: trim_name });
    carDispatch({ type: SET_CARSPECID, carSpecId: carSpecId });
    carDispatch({ type: SET_CARSPECPRICE, carSpecPrice });

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
    <>
      <DropDown>
        <DropDownButton
          setShowOtherColor={setShowOtherColor}
          showOtherColor={showOtherColor}
          phrase={'다른 외장 색상을 찾고 있나요?'}
        />
        <DropDownContent
          showOtherColor={showOtherColor}
          classifiedExteriorColor={classifiedExteriorColor}
        >
          <OtherExteriorItems
            classifiedExteriorColor={classifiedExteriorColor}
            clickHandler={clickHandler}
            setShowModal={setShowModal}
          />
        </DropDownContent>
      </DropDown>

      <ChangerModal
        wantedOtherColor={wantedOtherColor}
        wantedOtherColorTrim={wantedOtherColorTrim}
        showModal={showModal}
        setShowModal={setShowModal}
        clickHandler={changeHandler}
        type='exterial'
      />
    </>
  );
}

export default ExteriorDropDown;
