import { useEffect, useState } from 'react';
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
  const [showShareModal, setShowShareModal] = useState(false);
  const [showMailModal, setShowMailModal] = useState(false);
  const [showLoginModal, setShowLoginModal] = useState(false);

  useEffect(() => {
    window.scrollTo({
      top: 0,
    });
  }, []);

  return (
    <>
      <Head setShowShareModal={setShowShareModal} />
      <MyCarInfoWrapper>
        <SummaryInfo />
        <ColorInfo />
        <OptionInfo />
        <TotalPrice />
        <SaveButtons
          setShowMailModal={setShowMailModal}
          setShowLoginModal={setShowLoginModal}
        />
        <PurchaseCar />
        <QuotationPrice />
        <BottomButtons />
      </MyCarInfoWrapper>

      <ShareModal showModal={showShareModal} setShowModal={setShowShareModal} />
      <MailModal showModal={showMailModal} setShowModal={setShowMailModal} />
      <LoginModal showModal={showLoginModal} setShowModal={setShowLoginModal} />
    </>
  );
}

export default MyCarResultPage;
