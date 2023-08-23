import React, { useContext, useEffect, useRef, useState } from 'react';
import { optionDetailType } from '@/global/type';
import getOptionDetails from '@/api/option/getOptionDetails';
import Modal from '@/Components/Modal';
import PageButtons from './PageButtons';
import OptionCard from './OptionCard';
import { OptionContext } from '@/context/OptionProvider';
import getPackageOptionDetails from '@/api/option/getPackageOptionDetails';

interface OptionModalProps {
  showOptionModal: boolean;
  setShowOptionModal: React.Dispatch<React.SetStateAction<boolean>>;
  category: string;
}

function OptionModal({
  showOptionModal,
  setShowOptionModal,
  category,
}: OptionModalProps) {
  const { packageOption } = useContext(OptionContext);
  const optionDetailData = packageOption ? undefined : getOptionDetails();
  const packageOptionDetailData = packageOption
    ? getPackageOptionDetails()
    : undefined;
  const [detailOptions, setDetailOptions] = useState<string[]>();
  const scrollRef = useRef<HTMLDivElement>(null);
  const [optionCardData, setOptionCardData] = useState<
    optionDetailType[] | undefined
  >();

  const movePage = (direction: number) => {
    if (!scrollRef.current) return;

    const scrollLeft = scrollRef.current.scrollLeft;
    const newPosition = scrollLeft + 980 * direction;

    scrollRef.current.scrollTo({
      left: newPosition,
      behavior: 'smooth',
    });
  };

  const jumpPage = (step: number) => {
    if (!scrollRef.current) return;

    const newPosition = 980 * step;

    scrollRef.current.scrollTo({
      left: newPosition,
      behavior: 'smooth',
    });
  };

  useEffect(() => {
    if (packageOption) {
      if (packageOptionDetailData === undefined) return;
      setOptionCardData(packageOptionDetailData.data);
      setDetailOptions(
        packageOptionDetailData.data.map(item => item.option_name),
      );
    } else {
      if (optionDetailData === undefined) return;
      setOptionCardData([optionDetailData.data]);
    }
  }, [packageOptionDetailData, optionDetailData]);

  if (!optionCardData) return null;
  return (
    <Modal showModal={showOptionModal} setShowModal={setShowOptionModal}>
      {optionCardData.length > 1 && <PageButtons movePage={movePage} />}
      <div
        className='w-full h-[440px] absolute top-1/2 left-0 transform -translate-y-1/2 flex gap-20 overflow-x-auto noScrollBar'
        ref={scrollRef}
      >
        {optionCardData.map((item, idx) => (
          <OptionCard
            {...item}
            detailOptions={detailOptions}
            index={idx}
            length={optionCardData.length}
            key={idx}
            jumpPage={jumpPage}
            isSet={optionCardData.length > 1}
            category={category}
          />
        ))}
      </div>
    </Modal>
  );
}

export default OptionModal;
