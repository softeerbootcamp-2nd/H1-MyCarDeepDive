import { useContext } from 'react';
import Button from '@/Components/Button';
import { recommendType } from '@/api/Recommendation/getRecommendation';
import { CarContext } from '@/context/CarProvider';
import { useNavigate } from 'react-router';
import {
  ADD_OPTION_DATA_LIST,
  ADD_OPTION_LIST,
  SET_BODY,
  SET_CARSPECID,
  SET_CARSPECPRICE,
  SET_DRIVINGSYSTEM,
  SET_ENGINE,
  SET_EXTERIORCOLOR,
  SET_INTERIORCOLOR,
  SET_TRIMID,
  SET_TRIMNAME,
} from '@/context/CarProvider/type';

function Buttons({
  car_spec_id,
  total_price,
  engine_name,
  body_name,
  driving_system_name,
  trim_id,
  trim_name,
  exterior_color,
  interior_color,
  options,
  packages,
}: recommendType) {
  const navigation = useNavigate();
  const { carDispatch } = useContext(CarContext);

  const setRecommendData = () => {
    carDispatch({ type: SET_CARSPECID, carSpecId: car_spec_id });
    carDispatch({ type: SET_CARSPECPRICE, carSpecPrice: total_price });
    carDispatch({ type: SET_ENGINE, engine: engine_name });
    carDispatch({ type: SET_BODY, body: body_name });
    carDispatch({
      type: SET_DRIVINGSYSTEM,
      drivingSystem: driving_system_name,
    });
    carDispatch({ type: SET_TRIMID, trimId: trim_id });
    carDispatch({ type: SET_TRIMNAME, trimName: trim_name });

    carDispatch({
      type: SET_EXTERIORCOLOR,
      exteriorColor: {
        id: exterior_color.color_id,
        name: exterior_color.color_name,
        imgUrl: exterior_color.color_icon_url,
        price: exterior_color.color_price,
        chooseRate: 0,
      },
    });
    carDispatch({
      type: SET_INTERIORCOLOR,
      interiorColor: {
        id: interior_color.color_id,
        name: interior_color.color_name,
        imgUrl: interior_color.color_icon_url,
        price: interior_color.color_price,
        chooseRate: 0,
      },
    });
    carDispatch({
      type: ADD_OPTION_LIST,
      optionIdList: [...options, ...packages].map(item => item.option_id),
    });
    carDispatch({
      type: ADD_OPTION_DATA_LIST,
      optionData: [...options, ...packages].map(item => {
        return {
          name: item.option_name,
          price: item.option_price,
          imgUrl: item.option_img_url,
        };
      }),
    });
  };

  const customHandler = () => {
    setRecommendData();
    navigation('/select/trim');
  };

  const makeHandler = () => {
    setRecommendData();
    navigation('/mycar/ready');
  };

  return (
    <div className='flex justify-between'>
      <Button
        width='w-[298px]'
        height='h-[52px]'
        variant='secondary'
        text='커스텀하기'
        onClick={customHandler}
      />
      <Button
        width='w-[298px]'
        height='h-[52px]'
        variant='primary'
        text='빠른 견적내기'
        onClick={makeHandler}
      />
    </div>
  );
}

export default Buttons;
