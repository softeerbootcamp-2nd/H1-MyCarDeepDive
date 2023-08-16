interface Props {
  page: number;
  pageRef: React.RefObject<HTMLButtonElement>[];
  categoryClickHandler: (
    e: React.MouseEvent<HTMLButtonElement, MouseEvent>,
    page: number,
  ) => void;
}

function PageButton({ page, pageRef, categoryClickHandler }: Props) {
  return (
    <button
      ref={pageRef[page - 1]}
      className={`w-9 h-9 rounded-full font-body3-medium flex justify-center items-center ${
        page === page ? 'text-grey-100' : 'text-grey-300'
      }`}
      onClick={e => categoryClickHandler(e, page)}
    >
      {page}
    </button>
  );
}

export default PageButton;
