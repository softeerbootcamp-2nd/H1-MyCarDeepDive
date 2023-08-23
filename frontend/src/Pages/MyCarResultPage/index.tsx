import { useEffect, useState } from 'react';
import getMyCarResult from '@/api/myCar/getMyCarResult';
import Head from './Head';
import MyCarInfoWrapper from './MyCarInfoWrapper';
import SummaryInfo from './SummaryInfo';
import ColorInfo from './ColorInfo';
import OptionInfo from './OptionInfo';
import TotalPrice from './TotalPrice';
import SaveButtons from './SaveButtons';
import PurchaseCar from './PurchaseCar';
import QuotationPrice from './QuotationPrice';
import BottomButtons from './BottomButtons';
import ShareModal from './ShareModal';
import MailModal from './MailModal';
import LoginModal from './LoginModal';

function MyCarResultPage() {
  const myCarResultData = getMyCarResult();
  const [showShareModal, setShowShareModal] = useState(false);
  const [showMailModal, setShowMailModal] = useState(false);
  const [showLoginModal, setShowLoginModal] = useState(false);

  useEffect(() => {
    window.scrollTo({
      top: 0,
    });
  }, []);

  if (myCarResultData === undefined) return null;
  return (
    <>
      <Head
        setShowShareModal={setShowShareModal}
        car_name={myCarResultData.data.car_name}
        trim_name={myCarResultData.data.trim_name}
      />
      <MyCarInfoWrapper>
        <SummaryInfo
          car_name={myCarResultData.data.car_name}
          trim_name={myCarResultData.data.trim_name}
          basic_price={myCarResultData.data.basic_price}
          engine_name={myCarResultData.data.engine_name}
          body_name={myCarResultData.data.body_name}
          driving_system_name={myCarResultData.data.driving_system_name}
        />
        <ColorInfo
          exterior_color_name={myCarResultData.data.exterior_color_name}
          exterior_color_img_url={myCarResultData.data.exterior_color_img_url}
          exterior_color_price={myCarResultData.data.exterior_color_price}
          interior_color_name={myCarResultData.data.interior_color_name}
          interior_color_img_url={myCarResultData.data.interior_color_img_url}
          interior_color_price={myCarResultData.data.interior_color_price}
        />
        <OptionInfo option_list={myCarResultData.data.option_list} />
        <TotalPrice total_price={myCarResultData.data.total_price} />
        <SaveButtons
          setShowMailModal={setShowMailModal}
          setShowLoginModal={setShowLoginModal}
          pdf_url={myCarResultData.data.pdf_url}
        />
        <PurchaseCar />
        <QuotationPrice total_price={myCarResultData.data.total_price} />
        <BottomButtons />
      </MyCarInfoWrapper>

      <ShareModal showModal={showShareModal} setShowModal={setShowShareModal} />
      <MailModal showModal={showMailModal} setShowModal={setShowMailModal} />
      <LoginModal showModal={showLoginModal} setShowModal={setShowLoginModal} />
    </>
  );
}

export default MyCarResultPage;
