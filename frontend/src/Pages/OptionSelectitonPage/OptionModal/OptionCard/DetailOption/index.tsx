interface DetailOptionProps {
  detailOption: string;
  detailOptionName: string;
  order: number;
  jumpPage: (page: number) => void;
}

function DetailOption({
  detailOption,
  detailOptionName,
  order,
  jumpPage,
}: DetailOptionProps) {
  return (
    <span
      className={`mx-2.5 cursor-pointer ${
        detailOption === detailOptionName
          ? 'font-body4-medium text-secondary'
          : 'font-body4-regular text-grey-400 hover:text-grey-200'
      }`}
      onClick={() => jumpPage(order)}
    >
      {detailOption}
    </span>
  );
}

export default DetailOption;
